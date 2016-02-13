({
    changeRecordId : function(component, event) {
        // レコードID更新
        var recordId = event.getParam("recordId");
        component.set("v.recordId", recordId);
    },
    changePageType : function(component, event) {
        // ページタイプ切り替え
        var pageType = event.getParam("pageType");
        component.set("v.pageType", pageType);
    }
})