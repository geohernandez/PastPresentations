using System;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
/*using Microsoft.Data.Tools.Schema.Sql.UnitTesting;*/
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Configuration;
using Microsoft.SqlServer.Dac;

namespace MGPRM_UnitTesting
{
    [TestClass]
    public class SqlDatabaseSetup
    {
        [AssemblyInitialize]
        public static void InitializeAssembly(TestContext ctx)
        {
            //DeployByDacpac("MGPRM_UnitTesting");
            //ExecuteTestDbScripts("LoadAutoPayout", "MGPRM_UnitTesting");
            //ExecuteSqlWithoutTransaction("RECONFIGURE", "MGPRM_UnitTesting");
        }

        private static void DeployByDacpac(string databaseName)
        {
            string DatabaseConnectionString = ConfigurationManager.ConnectionStrings[databaseName].ConnectionString;
            string DatabaseName = databaseName;

            var instance = new DacServices(DatabaseConnectionString);
            var path =System.IO.Path.GetFullPath(@"..\..\..\MGPRM\bin\Debug\MGPRM.dacpac");

            bool success = true;


            var dacOptions = new DacDeployOptions();
            dacOptions.BlockOnPossibleDataLoss = false;

            var dacServiceInstance = new DacServices(DatabaseConnectionString);
            //If the DB has database reference then DACPAC technology not allow to deploy with SQL Variables
            //then temporary you should not use it
            try
            {
                using (DacPackage dacpac = DacPackage.Load(path))
                {
                    dacServiceInstance.Deploy(dacpac, DatabaseName,
                                            upgradeExisting: true,
                                            options: dacOptions);
                }

            }
            catch (Exception ex)
            {
                success = false;
            }

        }

        private static void DeployImpactTestSchema()
        {
            Debug.WriteLine("Deploying Database Project...");
            // This can only work if you have VS Ultimate
            // SqlDatabaseTestClass.TestService.GenerateData();
        }

        private static void CreateDatabase(string databaseName)
        {
            string masterConnectionString = CreateConnectionStringForDatabase("Master_DB");

            Console.WriteLine("Creating {0} Database...", databaseName);
            Console.WriteLine("ConnectionString for MasterDatabase={0}", masterConnectionString);

            using (var conn = new SqlConnection(masterConnectionString))
            {
                conn.Open();

                var cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandText = string.Format(@"
						IF EXISTS(SELECT * FROM sys.databases WHERE name='{0}')
						BEGIN
							USE master;
							ALTER DATABASE [{0}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
							DROP DATABASE [{0}];
						END

						DECLARE @FILENAME AS VARCHAR(255)

						SET @FILENAME = CONVERT(VARCHAR(255), SERVERPROPERTY('instancedefaultdatapath')) + '{0}';

						EXEC ('CREATE DATABASE [{0}] ON PRIMARY 
						(NAME = [{0}], 
						FILENAME =''' + @FILENAME + ''', 
						SIZE = 25MB, 
						MAXSIZE = 50MB, 
						FILEGROWTH = 5MB )')",
                    databaseName)
                };
                cmd.ExecuteNonQuery();
            }
        }

        private static string CreateConnectionStringForDatabase(string databaseName)
        {
            return ConfigurationManager.ConnectionStrings[databaseName].ConnectionString;
        }

        private static void ExecuteTestDbScripts(string subfolder, string databaseName)
        {
            //string directory = Path.Combine(Directory.GetCurrentDirectory(), "Deployment", subfolder);
            string directory = Path.Combine(Directory.GetCurrentDirectory().Replace("\\bin\\Debug", ""), "Deployment",
                subfolder);
            var dir = new DirectoryInfo(directory);

            var files = dir.GetFiles("*.sql", SearchOption.AllDirectories)
                .Where(x => !x.Name.StartsWith("DISABLED_"))
                .OrderBy(x => x.FullName)
                .ToList();

            Debug.WriteLine("Deploying scripts on " + directory + "...");

            foreach (FileInfo sqlFile in files)
            {
                ExecuteSqlFile(sqlFile, databaseName);
            }
        }

        private static readonly Regex GoRegex = new Regex(@"\bGO\b", RegexOptions.Compiled);

        private static void ExecuteSqlFile(FileInfo sqlFile, string databaseName)
        {
            Debug.WriteLine("Executing {0}", sqlFile);
            string sql = File.ReadAllText(sqlFile.FullName);
            ExecuteBatchedSql(sqlFile, databaseName, sql);
        }

        private static void ExecuteBatchedSql(FileInfo sqlFile, string databaseName, string sql)
        {
            string[] goSplitSql = GoRegex.Split(sql).Where(x => !string.IsNullOrWhiteSpace(x)).ToArray();

            using (var cnx = new SqlConnection(CreateConnectionStringForDatabase(databaseName)))
            {
                cnx.Open();
                using (var trn = cnx.BeginTransaction("InitSqlPart"))
                {
                    try
                    {
                        foreach (var sqlPart in goSplitSql)
                        {
                            using (var cmd = new SqlCommand(sqlPart, cnx, trn))
                            {
                                cmd.ExecuteNonQuery();
                            }
                        }

                        trn.Commit();
                    }
                    catch (SqlException ex)
                    {
                        Debug.WriteLine("SQL EXCEPTION: " + ex.Message);
                        try
                        {
                            trn.Rollback();
                        }
                        catch (SqlException rollBackEx)
                        {
                            Console.WriteLine("SQL EXCEPTION ON ROLLBACK: " + rollBackEx.Message);
                        }

                        throw new Exception(
                            "Failed executing " + sqlFile + ". You can disable this file by prepending DISABLED_ to its name.",
                            ex);
                    }
                }
            }
        }

        private static void ExecuteSqlWithoutTransaction(string sql, string databaseName)
        {
            Console.WriteLine("Executing {0}", sql);

            using (var cnx = new SqlConnection(CreateConnectionStringForDatabase(databaseName)))
            {
                cnx.Open();
                try
                {
                    using (var cmd = new SqlCommand(sql, cnx))
                    {
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("SQL EXCEPTION: " + ex.Message);
                    throw new Exception("Failed executing SQL.", ex);
                }
            }
        }
    }
}




