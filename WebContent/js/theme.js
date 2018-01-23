/* 
 * create by xeahsoon 2018/1/23 
 * refer to: https://segmentfault.com/a/1190000004344831
 * 
 * */

function Theme() {
	var blue = {
		color : [ '#1790cf', '#1bb2d8', '#99d2dd', '#88b0bb', '#1c7099',
				'#038cc4', '#75abd0', '#afd6dd' ]
	};
	this.getTheme = function(name) {
		if (name == "blue") {
			return blue;
		}
	}
}