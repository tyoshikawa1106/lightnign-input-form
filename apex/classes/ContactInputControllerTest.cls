@isTest
private class ContactInputControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void ContactInputControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            ContactInputController cls = new ContactInputController();
            
            Test.stopTest();
        }
    }

    /**
     * 保存処理
     * 必須エラー
     */
    static testMethod void doSaveContactTest1() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact();

            Test.startTest();
            
            ContactRegisterResult result = ContactInputController.doSaveContact(contact);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.contact.Id), true);
            System.assertEquals(result.messages.size(), 0);
            System.assertEquals(result.errorMessages.size(), 1);
        }
    }

    /**
     * 保存処理
     * エラーなし
     */
    static testMethod void doSaveContactTest2() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact(LastName = 'Yoshikawa');

            Test.startTest();
            
            ContactRegisterResult result = ContactInputController.doSaveContact(contact);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.contact.Id), true);
            System.assertEquals(result.messages.size(), 1);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 取引先の検索
     * 値なし
     */
    static testMethod void getAccountsTest1() {
        
        System.runAs(testAdminUser) {

            String key = '';

            Test.startTest();
            
            List<Account> results = ContactInputController.getAccounts(key);
            
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
            
            List<Account> results = ContactInputController.getAccounts(key);
            
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
            
            Contact result = ContactInputController.getContact(contactId);
            
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

            Test.startTest();
            
            Contact result = ContactInputController.getContact(contactId);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}