({
	selectAccount : function(component, event) {
		var accountName = component.get("v.accountName");
        var accountId = component.get("v.accountId");

        var myEvent = $A.get("e.c:LightningLookupAccountEvt");
        myEvent.setParams({
             "accountName": accountName
            ,"accountId": accountId
        });
        myEvent.fire();
	}
})