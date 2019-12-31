function UUID() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
};

	
/**
 * doT 根据模板生成html
 * temlateId：模板id
 * model:参数对象
 */
var templateContent = function(templateId,model){
    var tempFn = doT.template($("#"+templateId).text());
    var resultText = tempFn(model);
    return resultText;
};

// 输入格式：yyyy-MM-DD
function monthsBetween(sDate1, sDate2) {
    var nMonths = 0;
    try{
		sDate1 = new Date(sDate1);
		sDate2 = new Date(sDate2);
		var nDate1Months = sDate1.getYear() * 12 + sDate1.getMonth();
		var nDate2Months = sDate2.getYear() * 12 + sDate2.getMonth();
	    if(nDate1Months == nDate2Months){
	    	nMonths = 1;
	    }else{
	    	nMonths = Math.abs(nDate1Months - nDate2Months);
	    }
	}catch(e){
		nMonths = 0;
	}
    return nMonths;
};

