({
    doSave : function(component, event, helper) {
        // 取引先責任者の取引先ID項目にセット
        helper.setAccountIdFieldWithContact(component, event);
        // 必須チェック
        var isRequiredError = helper.checkRequiredFieldsWithContact(component, event);
        if (isRequiredError) {
            return false;
        }
        // メッセージ初期化
        helper.clearMessage(component, event);
        // 保存処理実行
        helper.doSave(component, event);
    },
    onCountryRadioGroup : function(component, event, helper) {
        // 国ラジオボタンの値をセット
        helper.setContryRadioVal(component, event);
    },
    accountRealtimeSearch : function(component, event, helper) {
        // 取引先検索
        helper.doAccountSearch(component, event);
    },
    setLookupAccount : function(component, event, helper) {
        // 取引先ルックアップの選択値をセット
        helper.setLookupAccount(component, event);
    },
    clearLookupAccount : function(component, event, helper) {
        // 取引先ルックアップの選択値をクリア
        helper.clearLookupAcount(component, event);
    },
    showPopupAccountSearch : function(component, event, helper) {
        event.preventDefault();
        // 取引先検索ポップアップ表示
        helper.showPopupAccountSearch(component, event, true);
    },
    hidePopupAccountSearch : function(component, event, helper) {
        // 取引先ルックアップの選択値をセット
        helper.showPopupAccountSearch(component, event, false);
    },
})