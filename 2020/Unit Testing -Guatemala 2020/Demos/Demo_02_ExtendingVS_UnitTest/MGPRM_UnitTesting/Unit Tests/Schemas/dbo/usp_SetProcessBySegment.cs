using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*using Microsoft.Data.Tools.Schema.Sql.UnitTesting;*/
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UnitTest.SQLEasyUnitTest.TestDB.Tests.Framework;

namespace DBUnitTest.Unit_Tests.Schemas.dbo
{

    [TestClass]
    public class usp_SetProcessBySegment : LocalTransactionSqlTest
    {

        public usp_SetProcessBySegment()
        {
            TestInitializeAction = Actions.CreateSingle(@"
        
            TRUNCATE TABLE dbo.ProcessMetricSegment

            ");
        }

        [TestMethod]
        public void usp_CheckingDataInsertedIntoProcessMetricSegmentIsOk()
        {

            RunTest(Actions.CreateBlock(@"

            --Initial load with valid values for the PlayerMetricSegment which is the base value
            --for calculating the new range of dates

             EXEC tSQLt.FakeTable 'dbo.ProcessMetricSegment';
            
            --Act
            EXEC [dbo].[usp_SetProcessBySegment]
                @range_start =1 ,
                @range_end =3 ,
                @initial_date ='20190101',
                @segmentid = 1
            
            --Assert
            --DataSet 1

            SELECT RangeValue,ProjectedDate 
            FROM ProcessMetricSegment;
            

            ")
          .ResultsetShouldBe(1, @"1	2019-01-02
                                  2	2019-01-03
                                  3	2019-01-04"));
        }




        }
    }
