({
    init : function(component, event, helper) {
        console.log('view init');
        // 初期処理
        helper.init(component, event);
    },
    editContact : function(component, event, helper) {
        // 編集
        helper.editContact(component, event);
    },
    deleteContact : function(component, event, helper) {
        // 削除
        helper.deleteContact(component, event);
    }
})