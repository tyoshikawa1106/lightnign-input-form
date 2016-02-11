@isTest
private class ContactRegisterResultTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void ContactRegisterResultTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            ContactRegisterResult cls = new ContactRegisterResult();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.contact.Id), true);
            System.assertEquals(cls.messages.size(), 0);
            System.assertEquals(cls.errorMessages.size(), 0);
        }
    }
}