({
    doSave : function(component, event) {
        // 取引先責任者情報の取得
        var contact = component.get("v.contact");
        // 取引先責任者の登録
        this.saveContact(component, contact, function(result) {
            var returnValue = result.getReturnValue();
            component.set("v.contact", returnValue.contact);
            component.set("v.messages", returnValue.messages);
            component.set("v.errorMessages", returnValue.errorMessages);
        });
    },
    saveContact : function(component, contact, callback) {
        // 取引先責任者の登録
        var action = component.get("c.doSaveContact");
        action.setParams({
            "contact": contact
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    clearMessage : function(component, event) {
        // メッセージクリア
        component.set("v.messages", []);
        component.set("v.errorMessages", []);
    },
    setContryRadioVal: function(component, event) {
        // 国ラジオボタンの値をセット
        var elem = event.getSource().getElement();
        var selectedContry = elem.value;
        component.set("v.contact.MailingCountry", selectedContry);
    },
    doAccountSearch : function(component, event) {
        // 検索キー取得
        var searchKey = event.target.value;
        // 取引先の検索
        this.searchAccount(component, searchKey, function(result) {
            var returnValue = result.getReturnValue();
            component.set("v.accounts", returnValue);
        });
    },
    searchAccount : function(component, searchKey, callback) {
        // 取引先の検索
        var action = component.get("c.getAccounts");
        action.setParams({
            "key": searchKey
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    setLookupAccount : function(component, event) {
        // 取引先IDと取引先名を取得
        var accountId = event.getParam("accountId");
        var accountName = event.getParam("accountName");
        // 取引先IDと取引先名をセット
        component.set("v.lookupAccountId", accountId);
        component.set("v.lookupAccountName", accountName);
        // 取引先リストクリア
        component.set("v.accounts", []);
    },
    clearLookupAcount : function(component, event) {
        // 取引先IDと取引先名をセット
        component.set("v.lookupAccountId", "");
        component.set("v.lookupAccountName", "");
        // 取引先リストクリア
        component.set("v.accounts", []);
    },
    setAccountIdFieldWithContact : function(component, event) {
        // ルックアップチェック
        var accountId = component.get("v.lookupAccountId");
        if (accountId) {
            component.set("v.contact.AccountId", accountId);
        } else {
            component.set("v.contact.AccountId", "");
        }
    },
    checkRequiredFieldsWithContact : function(component, event) {
        var isError = false;
        // 姓項目のチェック
        isError = this.checkInputFields(component, "v.contact.LastName", "input_lastName", "lastNameErrorMsg", isError);
        // 国項目のチェック
        isError = this.checkInputFields(component, "v.contact.MailingCountry", "input_country", "countryErrorMsg", isError);

        if (isError) {
            component.set("v.errorMessages", ["未入力の必須項目があります。エラーメッセージを確認してください"]);
            component.set("v.messages", []);
        }

        return isError;
    },
    checkInputFields : function(component, inputFieldValKey, inputFieldsKey, errorMsgKey, isError) {
        // 項目の値
        var inputFieldsVal = component.get(inputFieldValKey);
        // 入力フィールド
        var inputFields = component.find(inputFieldsKey);
        // エラーメッセージフィールド
        var errorMsgKey = component.find(errorMsgKey);
        // 値の存在チェック
        if (!inputFieldsVal) {
            // エラークラス追加
            $A.util.addClass(inputFields.getElement(), 'slds-has-error');
            // エラーメッセージセット
            errorMsgKey.set("v.value", "値を入力してください");
            isError = true;
        } else {
            $A.util.removeClass(inputFields.getElement(), 'slds-has-error');
            errorMsgKey.set("v.value", "");
        }
        return isError;
    },
    showPopupAccountSearch : function(component, event, isShow) {
        // 取引先検索ポップアップ表示
        component.set("v.isPopupAccountShow", isShow);
    }
})