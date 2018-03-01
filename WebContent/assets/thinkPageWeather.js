/**
 * Created by xeahsoon on 2018/03/01.
 * https://www.seniverse.com
 */
(function(T, h, i, n, k, P, a, g, e) {
	g = function() {
		P = h.createElement(i);
		a = h.getElementsByTagName(i)[0];
		P.src = k;
		P.charset = "utf-8";
		P.async = 1;
		a.parentNode.insertBefore(P, a)
	};
	T["ThinkPageWeatherWidgetObject"] = n;
	T[n] || (T[n] = function() {
		(T[n].q = T[n].q || []).push(arguments)
	});
	T[n].l = +new Date();
	if (T.attachEvent) {
		T.attachEvent("onload", g)
	} else {
		T.addEventListener("load", g, false)
	}
}(window, document, "script", "tpwidget",
		"//widget.seniverse.com/widget/chameleon.js"))
tpwidget("init", {
	"flavor" : "slim",
	"location" : "WX4FBXXFKE4F",
	"geolocation" : "enabled",
	"language" : "zh-chs",
	"unit" : "c",
	"theme" : "chameleon",
	"container" : "tp-weather-widget",
	"bubble" : "enabled",
	"alarmType" : "badge",
	"color" : "#FFFFFF",
	"uid" : "UC9078B2DF",
	"hash" : "21e4da75eb836ad799274cd6bdaa71e7"
});
tpwidget("show");