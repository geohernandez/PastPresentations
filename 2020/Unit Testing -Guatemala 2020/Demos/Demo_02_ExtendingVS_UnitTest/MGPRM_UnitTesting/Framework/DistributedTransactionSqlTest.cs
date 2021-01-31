using System.Transactions;
using UnitTest.SQLEasyUnitTest.TestDB.Tests.Framework;

namespace Frontiers.Impact.ImpactDB.Tests.Framework
{
    public abstract class DistributedTransactionSqlTest : SqlTest
    {
        private TransactionScope _trans;

        protected override void OnBeforeInitializeTest()
        {
            _trans = new TransactionScope(TransactionScopeOption.Required);
        }

        protected override void OnAfterCleanupTest()
        {
            _trans.Dispose();
        }
    }
}