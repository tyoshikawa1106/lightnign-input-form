public with sharing class ContactRegisterDao {
    
    /**
     * コンストラクタ
     */
    public ContactRegisterDao() {
        
    }

    /**
     * 取引先情報取得
     */
    public List<Account> getAccounts(String key) {
        String searchKey = key + '%';
        return [SELECT Id,Name FROM Account WHERE Name LIKE: searchKey ORDER BY Name ASC LIMIT 20];
    }

    /**
     * 取引先責任者情報を取得
     */
    public Contact getContact(String contactId) {
        List<Contact> contacts = [
            SELECT
                 Id
                ,LastName
                ,FirstName
                ,AccountId
                ,Account.Name
                ,Phone
                ,Email
                ,HasOptedOutOfEmail
                ,Birthdate
                ,LeadSource
                ,MailingCountry
                ,Description
            FROM
                Contact
            WHERE
                Id =: contactId
            LIMIT 1
        ];

        return contacts.isEmpty() ? new Contact() : contacts[0];
    }

    /**
     * 削除対象の取引先責任者ID取得
     */
    public Contact getDeleteContact(String contactId) {
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id =: contactId LIMIT 1];
        return contacts.isEmpty() ? new Contact() : contacts[0];
    }
}