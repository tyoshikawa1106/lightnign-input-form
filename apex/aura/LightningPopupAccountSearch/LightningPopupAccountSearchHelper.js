({
    searchBtn : function(component, event) {
        alert("coming soon...");
    },
    cancelBtn : function(component, event) {
        var myEvent = $A.get("e.c:LightningPopupAccountSearchCancelEvt");
        myEvent.fire();
    },
    selectAccount : function(component, event) {
        alert("coming soon...");
    }
})