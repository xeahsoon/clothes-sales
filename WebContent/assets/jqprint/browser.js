/**
 * Created by xeahsoon on 2018/02/07.
 *  browser就是用来获取浏览器基本信息的。
 *  jQuery 从 1.9 版开始，移除了 $.browser 和 $.browser.version ， 取而代之的是 $.support 。 在更新的 2.0 版本中，将不再支持 IE 6/7/8。 以后，如果用户需要支持 IE 6/7/8，只能使用 jQuery 1.9。
 */

(function(jQuery) {

	if (jQuery.browser)
		return;

	jQuery.browser = {};
	jQuery.browser.mozilla = false;
	jQuery.browser.webkit = false;
	jQuery.browser.opera = false;
	jQuery.browser.msie = false;

	var nAgt = navigator.userAgent;
	jQuery.browser.name = navigator.appName;
	jQuery.browser.fullVersion = '' + parseFloat(navigator.appVersion);
	jQuery.browser.majorVersion = parseInt(navigator.appVersion, 10);
	var nameOffset, verOffset, ix;

	// In Opera, the true version is after "Opera" or after "Version"
	if ((verOffset = nAgt.indexOf("Opera")) != -1) {
		jQuery.browser.opera = true;
		jQuery.browser.name = "Opera";
		jQuery.browser.fullVersion = nAgt.substring(verOffset + 6);
		if ((verOffset = nAgt.indexOf("Version")) != -1)
			jQuery.browser.fullVersion = nAgt.substring(verOffset + 8);
	}
	// In MSIE, the true version is after "MSIE" in userAgent
	else if ((verOffset = nAgt.indexOf("MSIE")) != -1) {
		jQuery.browser.msie = true;
		jQuery.browser.name = "Microsoft Internet Explorer";
		jQuery.browser.fullVersion = nAgt.substring(verOffset + 5);
	}
	// In Chrome, the true version is after "Chrome"
	else if ((verOffset = nAgt.indexOf("Chrome")) != -1) {
		jQuery.browser.webkit = true;
		jQuery.browser.name = "Chrome";
		jQuery.browser.fullVersion = nAgt.substring(verOffset + 7);
	}
	// In Safari, the true version is after "Safari" or after "Version"
	else if ((verOffset = nAgt.indexOf("Safari")) != -1) {
		jQuery.browser.webkit = true;
		jQuery.browser.name = "Safari";
		jQuery.browser.fullVersion = nAgt.substring(verOffset + 7);
		if ((verOffset = nAgt.indexOf("Version")) != -1)
			jQuery.browser.fullVersion = nAgt.substring(verOffset + 8);
	}
	// In Firefox, the true version is after "Firefox"
	else if ((verOffset = nAgt.indexOf("Firefox")) != -1) {
		jQuery.browser.mozilla = true;
		jQuery.browser.name = "Firefox";
		jQuery.browser.fullVersion = nAgt.substring(verOffset + 8);
	}
	// In most other browsers, "name/version" is at the end of userAgent
	else if ((nameOffset = nAgt.lastIndexOf(' ') + 1) < (verOffset = nAgt
			.lastIndexOf('/'))) {
		jQuery.browser.name = nAgt.substring(nameOffset, verOffset);
		jQuery.browser.fullVersion = nAgt.substring(verOffset + 1);
		if (jQuery.browser.name.toLowerCase() == jQuery.browser.name
				.toUpperCase()) {
			jQuery.browser.name = navigator.appName;
		}
	}
	// trim the fullVersion string at semicolon/space if present
	if ((ix = jQuery.browser.fullVersion.indexOf(";")) != -1)
		jQuery.browser.fullVersion = jQuery.browser.fullVersion
				.substring(0, ix);
	if ((ix = jQuery.browser.fullVersion.indexOf(" ")) != -1)
		jQuery.browser.fullVersion = jQuery.browser.fullVersion
				.substring(0, ix);

	jQuery.browser.majorVersion = parseInt('' + jQuery.browser.fullVersion, 10);
	if (isNaN(jQuery.browser.majorVersion)) {
		jQuery.browser.fullVersion = '' + parseFloat(navigator.appVersion);
		jQuery.browser.majorVersion = parseInt(navigator.appVersion, 10);
	}
	jQuery.browser.version = jQuery.browser.majorVersion;
})(jQuery);