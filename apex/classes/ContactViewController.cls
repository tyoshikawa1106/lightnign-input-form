public with sharing class ContactViewController {

    private static ContactRegisterDao dao = new ContactRegisterDao();

    /**
     * コンストラクタ
     */
    public ContactViewController() {
        
    }

    /**
     * 取引先責任者の取得
     */
    @AuraEnabled
    public static Contact getContact(String contactId) {
        // 取引先責任者ID存在判定
        if (String.isEmpty(contactId)) return new Contact();
        // 取引先責任者取得
        return dao.getContact(contactId);
    }

    /**
     * 取引先責任者の削除
     */
    @AuraEnabled
    public static void doDeleteContact(String contactId) {
        // 取引先責任者ID存在判定
        if (String.isEmpty(contactId)) return;
        // 取引先責任者の削除
        delete dao.getDeleteContact(contactId);
    }
}