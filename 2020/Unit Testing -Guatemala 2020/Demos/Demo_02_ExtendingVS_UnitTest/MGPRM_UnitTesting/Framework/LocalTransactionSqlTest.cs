using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using UnitTest.SQLEasyUnitTest.TestDB.Tests.Framework;

namespace UnitTest.SQLEasyUnitTest.TestDB.Tests.Framework
{
    public abstract class LocalTransactionSqlTest : SqlTest
    {
        protected override void OnBeforeInitializeTest()
        {
            if (TestInitializeAction == null)
            {
                TestInitializeAction = new SqlDatabaseTestAction();
            };

            TestInitializeAction.SqlScript =
                $@"
BEGIN TRAN
SAVE TRAN TestRun
{TestInitializeAction.SqlScript}";
            if (TestCleanupAction == null)
            {
                TestCleanupAction = new SqlDatabaseTestAction();
            }

            TestCleanupAction.SqlScript =
                $@"
{TestCleanupAction.SqlScript}
ROLLBACK TRAN TestRun";
        }
    }
}