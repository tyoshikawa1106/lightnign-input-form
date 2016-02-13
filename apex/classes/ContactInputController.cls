public with sharing class ContactInputController {

    private static ContactRegisterDao dao = new ContactRegisterDao();

    /**
     * コンストラクタ
     */
    public ContactInputController() {
        
    }

    /**
     * 保存処理
     */
    @AuraEnabled
    public static ContactRegisterResult doSaveContact(Contact contact) {
        ContactRegisterResult result = new ContactRegisterResult();
        try {
            // 取引先責任者登録
            upsert contact;
            // 戻り値にセット
            result.contact = contact;
            // 正常終了メッセージをセット
            result.messages.add('Contact Success!!');
        } catch(DmlException e) {
            result.errorMessages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            result.errorMessages.add(e.getMessage());
            return result;
        }
        return result;
    }

    /**
     * 取引先の検索
     */
    @AuraEnabled
    public static List<Account> getAccounts(String key) {
        if (String.isEmpty(key)) {
            return new List<Account>();
        }
        return dao.getAccounts(key);
    }

    /**
     * 取引先責任者の検索
     */
    @AuraEnabled
    public static Contact getContact(String contactId) {
        if (String.isEmpty(contactId)) {
            return new Contact();
        }
        return dao.getContact(contactId);
    }
}