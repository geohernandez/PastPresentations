using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UnitTest.SQLEasyUnitTest.TestDB.Tests.Framework;

namespace MGPRM_UnitTesting.Unit_Tests.Schemas.dbo
{
    [TestClass]
    public class sql_easyframework:LocalTransactionSqlTest
    {


        [TestMethod]
        public void CheckMultipleDataSetsResults()
        {
            RunTest(Actions.CreateBlock(@"
              
              SELECT 1,2,3

              SELECT 'A','B','C'
                    "
                    ).ResultsetShouldBe(1, @"1	2	3")
                     .ResultsetShouldBe(2, @"A	B	C")      
            );
         }


    }
}
