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
    public class usp_SetProcessBySegment_Template:LocalTransactionSqlTest
    {
        [TestMethod]
        public void CheckDataSetResultforMetricSegmentIsOk_Template()
        {
            RunTest(Actions.CreateBlock(@"
            
         --Initial load with valid values for the PlayerMetricSegment which is the base value
         --for calculating the new range of dates

         --Arrange (Setup a SegmentId to avoid FK violation)
         INSERT INTO dbo.Segment
         (
             [SegmentID],
             [Description],
             [Status]
         )
         VALUES
         (1, 'Segment 1', 1);

         --Act
         EXEC [dbo].[usp_SetProcessBySegment] @range_start = 1,
                                              @range_end = 3,
                                              @initial_date = '20190101',
                                              @segmentid = 1;

         --Assert
         --DataSet 1

         SELECT
                SegmentID,
                RangeValue,
                ProjectedDate
         FROM ProcessMetricSegment;

                "
                ).ResultsetShouldBe(1,
                @"1	1	2019-01-02
1	2	2019-01-03
1	3	2019-01-04"));
        }

    }
}
