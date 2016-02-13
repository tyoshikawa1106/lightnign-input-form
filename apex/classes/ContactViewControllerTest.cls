@isTest
private class ContactViewControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void ContactViewControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            ContactViewController cls = new ContactViewController();
            
            Test.stopTest();
        }
    }

    /**
     * 取引先責任者の取得
     * 値なし
     */
    static testMethod void getContactTest1() {
        
        System.runAs(testAdminUser) {

            String contactId = '';

            Test.startTest();
            
            Contact result = ContactViewController.getContact(contactId);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 取引先責任者の取得
     * 値あり
     */
    static testMethod void getContactTest2() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact(LastName = 'Yoshikawa');
            insert contact;
            String contactId = contact.Id;

            Test.startTest();
            
            Contact result = ContactViewController.getContact(contactId);
            System.assertEquals(String.isNotEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 取引先責任者の削除
     * 値なし
     */
    static testMethod void getDeleteContactTest1() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact(LastName = 'Yoshikawa');
            insert contact;
            String contactId = '';

            Test.startTest();
            
            ContactViewController.doDeleteContact(contactId);
            
            Test.stopTest();

            Integer resultContactCnt = [SELECT COUNT() FROM Contact LIMIT 1];
            System.assertEquals(resultContactCnt, 1);
        }
    }

    /**
     * 取引先責任者の削除
     * 値あり
     */
    static testMethod void getDeleteContactTest2() {
        
        System.runAs(testAdminUser) {

            Contact contact = new Contact(LastName = 'Yoshikawa');
            insert contact;
            String contactId = contact.Id;

            Test.startTest();
            
            ContactViewController.doDeleteContact(contactId);
            
            Test.stopTest();

            Integer resultContactCnt = [SELECT COUNT() FROM Contact LIMIT 1];
            System.assertEquals(resultContactCnt, 0);
        }
    }
}