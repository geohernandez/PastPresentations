using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*using Microsoft.Data.Tools.Schema.Sql.UnitTesting;*/
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UnitTest.SQLEasyUnitTest.TestDB.Tests.Framework;

namespace AWUnitTestExtended.Unit_Tests.Schemas.dbo
{

    [TestClass]
    public class usp_SetProcessBySegment : LocalTransactionSqlTest
    {

        public usp_SetProcessBySegment()
        {
            TestInitializeAction = Actions.CreateSingle(@"
        
            --Escribir aqui cualquier inicializacion requerida , valores que deben ser insertados

            ");
        }

        [TestMethod]
        public void usp_CheckingDataInsertedIntoProcessMetricSegmentIsOk()
        {

            RunTest(Actions.CreateBlock(@"
             --AAA (Arrange, Act, Assert)

             --Arrange
             DECLARE @RC AS INT, @StartProductID AS INT =805 , @CheckDate AS DATETIME=GETDATE();
          
            --Act
           EXECUTE @RC = [dbo].[uspGetBillOfMaterials] @StartProductID, @CheckDate;
            
            --Assert
           --Results should be consistent with ResultShouldBe section
            

            ")
          .ResultsetShouldBe(1, @"805	1	Adjustable Race	1.00	0.00	0.00	2	0
805	4	Headset Ball Bearings	8.00	0.00	0.00	2	0
805	323	Crown Race	1.00	0.00	0.00	2	0
805	402	Keyed Washer	1.00	0.00	0.00	2	0
805	459	Lock Nut 19	1.00	0.00	0.00	2	0
805	462	Lower Head Race	1.00	0.00	0.00	2	0"));
        }


        [TestMethod]
        public void usp_CheckingDataInsertedIntoProcessMetricSegment_InsertingNewRow()
        {
            /*Poner atencion a que pasa luego de que las pruebas han finalizado*/
            RunTest(Actions.CreateBlock(@"
             --AAA (Arrange, Act, Assert)

             --Arrange
             DECLARE @RC AS INT, @StartProductID AS INT =805 , @CheckDate AS DATETIME=GETDATE();

            INSERT INTO [Production].[BillOfMaterials](ProductAssemblyId,ComponentId,StartDate,EndDAte,UnitMeasureCode,BOMLevel,PerAssemblyQty,ModifiedDate)
	        VALUES(805,2,'2010-09-15 00:00:00.000',NULL,'EA',2,6,'2010-09-15 00:00:00.000');
          
            --Act
           EXECUTE @RC = [dbo].[uspGetBillOfMaterials] @StartProductID, @CheckDate;
            
            --Assert
           --Results should be consistent with ResultShouldBe section
            

            ")
          .ResultsetShouldBe(1, @"805	1	Adjustable Race	1.00	0.00	0.00	2	0
805	2	Bearing Ball	6.00	0.00	0.00	2	0
805	4	Headset Ball Bearings	8.00	0.00	0.00	2	0
805	323	Crown Race	1.00	0.00	0.00	2	0
805	402	Keyed Washer	1.00	0.00	0.00	2	0
805	459	Lock Nut 19	1.00	0.00	0.00	2	0
805	462	Lower Head Race	1.00	0.00	0.00	2	0"));
        }

    }
    }
