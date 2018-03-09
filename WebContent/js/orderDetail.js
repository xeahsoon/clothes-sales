$(document).ready(function(){
	// 反选商品
    var i=0;
    $("#check_ok").click(function(){
        $(":checkbox").click();
        $("#check_ok").hide();
        $("#check_remove").slideDown();
    });

    $("#check_remove").click(function(){
        $(":checkbox").click();
        $("#check_remove").hide();
        $("#check_ok").fadeIn();
    });
    // 监听搜索
    $("#search_id").keydown(function(e) {
    	var theEvent = window.event || e;
		var code = theEvent.keyCode || theEvent.which;
    	if(code == 13) {
    		search();
    	}
    });
});