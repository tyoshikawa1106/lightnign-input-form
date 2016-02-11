@isTest
private class ContactInputDaoTest {

    private static ContactInputDao dao = new ContactInputDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 取引先の検索
     * 値なし
     */
    static testMethod void getAccountsTest1() {
        
        System.runAs(testAdminUser) {

            String key = '';

            Test.startTest();
            
            List<Account> accounts = dao.getAccounts(key);
            
            Test.stopTest();

            System.assertEquals(accounts.size(), 0);
        }
    }

    /**
     * 取引先の検索
     * 値あり
     */
    static testMethod void getAccountsTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'salesforce.com');
            insert account;

            String key = 'sales';

            Test.startTest();
            
            List<Account> accounts = dao.getAccounts(key);
            
            Test.stopTest();

            System.assertEquals(accounts.size(), 1);
        }
    }
}