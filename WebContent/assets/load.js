/**
 * Created by xeahsoon on 2018/02/11.
 * jQuery load()方法加载右侧div内容
 */

function LoadRight(url) {
	$("#right_content").load(url, function(responseTxt, statusTxt, xhr) {
		if (statusTxt == "success") {
			console.log("Loading.. " + url);
			
			if(url.search("makeOrder") != -1) {
            	$("#bar_code").focus();
            }
		}
		if (statusTxt == "error") {
			alert("Error: " + xhr.status + ": " + xhr.statusText);
		}
	});
}