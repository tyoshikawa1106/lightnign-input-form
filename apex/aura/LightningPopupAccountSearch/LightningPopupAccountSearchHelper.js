({
    searchAccount : function(component, event) {
        // 検索キー取得
        var searchKey = '';
        if (component.find("searchKey").get("v.value")) {
            searchKey = component.find("searchKey").get("v.value");
        }
        // 取引先の検索
        this.searchAccountAction(component, searchKey, function(result) {
            var returnValue = result.getReturnValue();
            component.set("v.accounts", returnValue);
        });
    },
    searchAccountAction : function(component, searchKey, callback) {
        console.log(searchKey);
        // 取引先の検索
        var action = component.get("c.getAccounts");
        action.setParams({
             "searchKey": searchKey
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    cancel : function(component, event) {
        var myEvent = $A.get("e.c:LightningPopupAccountSearchCancelEvt");
        myEvent.fire();
    },
    selectAccount : function(component, event) {
        this.sampleAlert(component, event);
    },
    sampleAlert : function(component, event) {
        alert("coming soon...");
    }
})