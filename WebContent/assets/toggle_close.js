/**
 * Created by xeahsoon on 2018/02/05.
 * 面板收起、关闭
 */

var toggle_close = {
	init: function() {
		$('.nav-toggle-alt').click(function() {
		    //get collapse content selector
		    var collapse_content_selector = $(this).attr('href');
		
		    //make the collapse content to be shown or hide
		    var toggle_switch = $(this);
		    $(collapse_content_selector).slideToggle(function() {
		        if ($(this).css('display') == 'block') {
		            //change the button label to be 'Show'
		            toggle_switch.html('<span class="glyphicon glyphicon-chevron-up"></span>');
		        } else {
		            //change the button label to be 'Hide'
		            toggle_switch.html('<span class="glyphicon glyphicon-chevron-down"></span>');
		        }
		    });
		    return false;
		});
		
		$(".gone").click(function() {
		    var collapse_content_close = $(this).attr('href');
		    $(collapse_content_close).hide();
		});
	}
}