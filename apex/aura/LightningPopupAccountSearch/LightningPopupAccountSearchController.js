({
    searchAccount : function(component, event, helper) {
        // 取引先の検索
        helper.searchAccount(component, event);
    },
    cancel : function(component, event, helper) {
        // キャンセル
        helper.cancel(component, event);
    },
    selectAccount : function(component, event, helper) {
        // 取引先の選択
        helper.selectAccount(component, event);
    },
    sampleAlert : function(component, event, helper) {
        // サンプルアラート
        helper.sampleAlert(component, event);
    }
})