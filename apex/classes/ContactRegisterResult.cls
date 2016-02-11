public with sharing class ContactRegisterResult {

    @AuraEnabled
    public Contact contact {get; set;}
    @AuraEnabled
    public List<String> messages {get; set;}
    @AuraEnabled
    public List<String> errorMessages {get; set;}

    /**
     * コンストラクタ
     */
    public ContactRegisterResult() {
        this.contact = new contact();
        this.messages = new List<String>();
        this.errorMessages = new List<String>();
    }
}