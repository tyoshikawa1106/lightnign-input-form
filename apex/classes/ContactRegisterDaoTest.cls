@isTest
private class ContactRegisterDaoTest {

    private static ContactRegisterDao dao = new ContactRegisterDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 取引先の検索
     * 値なし
     */
    static testMethod void getAccountsTest1() {
        
        System.runAs(testAdminUser) {

            String key = '';

            Test.startTest();
            
            List<Account> results = dao.getAccounts(key);
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
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
            
            List<Account> results = dao.getAccounts(key);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * 取引先責任者の検索
     * 値なし
     */
    static testMethod void getContactTest1() {
        
        System.runAs(testAdminUser) {

            String contactId = '';

            Test.startTest();
            
            Contact result = dao.getContact(contactId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 取引先責任者の検索
     * 値あり
     */
    static testMethod void getContactTest2() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact(LastName = 'Yoshikawa');
            insert contact;

            String contactId = contact.Id;
            System.assertEquals(String.isNotEmpty(contactId), true);

            Test.startTest();
            
            Contact result = dao.getContact(contactId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }

    /**
     * 削除対象の取引先責任者ID取得
     * 値なし
     */
    static testMethod void getDeleteContactTest1() {
        
        System.runAs(testAdminUser) {

            String contactId = '';

            Test.startTest();
            
            Contact result = dao.getDeleteContact(contactId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 削除対象の取引先責任者ID取得
     * 値あり
     */
    static testMethod void getDeleteContactTest2() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact(LastName = 'Yoshikawa');
            insert contact;

            String contactId = contact.Id;
            System.assertEquals(String.isNotEmpty(contactId), true);

            Test.startTest();
            
            Contact result = dao.getDeleteContact(contactId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}