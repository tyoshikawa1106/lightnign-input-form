public with sharing class ContactInputDao {
    
    /**
     * コンストラクタ
     */
    public ContactInputDao() {
        
    }

    /**
     * 取引先情報取得
     */
    public List<Account> getAccounts(String key) {
        String searchKey = key + '%';
        return [SELECT Id,Name FROM Account WHERE Name LIKE: searchKey ORDER BY Name ASC LIMIT 20];
    }
}