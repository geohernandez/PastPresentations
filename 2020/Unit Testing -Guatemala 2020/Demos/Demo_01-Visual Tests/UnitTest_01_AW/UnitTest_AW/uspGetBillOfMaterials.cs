using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTest_AW
{
    [TestClass()]
    public class uspGetBillOfMaterials : SqlDatabaseTestClass
    {

        public uspGetBillOfMaterials()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_uspGetBillOfMaterialsTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(uspGetBillOfMaterials));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition rowCountConditionIsTrue;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueConditionComponentId;
            this.dbo_uspGetBillOfMaterialsTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            dbo_uspGetBillOfMaterialsTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            rowCountConditionIsTrue = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition();
            scalarValueConditionComponentId = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            // 
            // dbo_uspGetBillOfMaterialsTest_TestAction
            // 
            dbo_uspGetBillOfMaterialsTest_TestAction.Conditions.Add(rowCountConditionIsTrue);
            dbo_uspGetBillOfMaterialsTest_TestAction.Conditions.Add(scalarValueConditionComponentId);
            resources.ApplyResources(dbo_uspGetBillOfMaterialsTest_TestAction, "dbo_uspGetBillOfMaterialsTest_TestAction");
            // 
            // rowCountConditionIsTrue
            // 
            rowCountConditionIsTrue.Enabled = true;
            rowCountConditionIsTrue.Name = "rowCountConditionIsTrue";
            rowCountConditionIsTrue.ResultSet = 1;
            rowCountConditionIsTrue.RowCount = 6;
            // 
            // scalarValueConditionComponentId
            // 
            scalarValueConditionComponentId.ColumnNumber = 2;
            scalarValueConditionComponentId.Enabled = true;
            scalarValueConditionComponentId.ExpectedValue = "326";
            scalarValueConditionComponentId.Name = "scalarValueConditionComponentId";
            scalarValueConditionComponentId.NullExpected = false;
            scalarValueConditionComponentId.ResultSet = 1;
            scalarValueConditionComponentId.RowNumber = 3;
            // 
            // dbo_uspGetBillOfMaterialsTestData
            // 
            this.dbo_uspGetBillOfMaterialsTestData.PosttestAction = null;
            this.dbo_uspGetBillOfMaterialsTestData.PretestAction = null;
            this.dbo_uspGetBillOfMaterialsTestData.TestAction = dbo_uspGetBillOfMaterialsTest_TestAction;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        [TestMethod()]
        public void dbo_uspGetBillOfMaterialsTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_uspGetBillOfMaterialsTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }
        private SqlDatabaseTestActions dbo_uspGetBillOfMaterialsTestData;
    }
}
