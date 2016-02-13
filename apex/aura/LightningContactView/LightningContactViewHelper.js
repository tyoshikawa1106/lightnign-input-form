({
    init : function(component, event) {
        // 取引先責任者IDの取得
        var contactId = component.get("v.recordId");
        // 取引先責任者の取得
        this.getContactAction(component, contactId, function(result) {
            var returnValue = result.getReturnValue();
            // 取引先責任者の情報をセット
            component.set("v.contact", returnValue);
        });
    },
    getContactAction : function(component, contactId, callback) {
        // 取引先責任者の登録
        var action = component.get("c.getContact");
        action.setParams({
            "contactId": contactId
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    editContact : function(component, event) {
        // 編集画面に切り替え
        this.editContactEvent(component, event);
    },
    editContactEvent : function(component) {
        // 編集画面に切り替え
        var myEvent = $A.get("e.c:LightningContactRegisterPageTypeEvt");
        myEvent.setParams({
             "pageType": "input"
            ,"recordId": component.get("v.contact.Id")
        });
        myEvent.fire();
    },
    deleteContact : function(component, event) {
        // 取引先責任者IDの取得
        var contactId = component.get("v.recordId");
        // 取引先責任者の取得
        this.deleteContactAction(component, contactId, function(result) {
            // 取引先責任者のホームに遷移
            this.deleteContactToHomeEvt(component);
        });
    },
    deleteContactAction : function(component, contactId, callback) {
        // 取引先責任者の登録
        var action = component.get("c.doDeleteContact");
        action.setParams({
            "contactId": contactId
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    deleteContactToHomeEvt : function(component) {
        // 取引先責任者のホームに遷移
        var myEvent = $A.get("e.force:navigateToObjectHome");
        myEvent.setParams({
            "scope": "Contact"
        });
        myEvent.fire();
    }
})