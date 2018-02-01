/* Bootstrap Search Suggest */

/* 事件监听 */
// onDataRequestSuccess: 当 AJAX 请求数据成功时触发，并传回结果到第二个参数
// onSetSelectValue：当从下拉菜单选取值时触发，并传回设置的数据到第二个参数
// onUnsetSelectValue：当设置了 idField，且自由输入内容时触发（与背景警告色显示同步）
$("#test")
    .on('onDataRequestSuccess', function (event, result) {
        console.log(result);
    })
    .on('onSetSelectValue', function (e, keyword) {
        console.log('onSetSelectValue: ', keyword);
    })
    .on('onUnsetSelectValue', function (e) {
        console.log('onUnsetSelectValue');
    });

/* 配置参数 */
var defaultOptions = {
    url: null,                      //请求数据的 URL 地址
    jsonp: null,                    //设置此参数名，将开启jsonp功能，否则使用json数据结构
    data: {             
        value: []               
    },                              //提示所用的数据，注意格式
    indexId: 0,                     //每组数据的第几个数据，作为input输入框的 data-id，设为 -1 且 idField 为空则不设置此值
    indexKey: 0,                    //每组数据的第几个数据，作为input输入框的内容
    idField: '',                    //每组数据的哪个字段作为 data-id，优先级高于 indexId 设置（推荐）
    keyField: '',                   //每组数据的哪个字段作为输入框内容，优先级高于 indexKey 设置（推荐）

    /* 搜索相关 */
    autoSelect: true,               //键盘向上/下方向键时，是否自动选择值
    allowNoKeyword: true,           //是否允许无关键字时请求数据
    getDataMethod: 'firstByUrl',    //获取数据的方式，url：一直从url请求；data：从 options.data 获取；firstByUrl：第一次从Url获取全部数据，之后从options.data获取
    delayUntilKeyup: false,         //获取数据的方式 为 firstByUrl 时，是否延迟到有输入时才请求数据
    ignorecase: false,              //前端搜索匹配时，是否忽略大小写
    effectiveFields: [],            //有效显示于列表中的字段，非有效字段都会过滤，默认全部。
    effectiveFieldsAlias: {},       //有效字段的别名对象，用于 header 的显示
    searchFields: [],               //有效搜索字段，从前端搜索过滤数据时使用，但不一定显示在列表中。effectiveFields 配置字段也会用于搜索过滤
    twoWayMatch: true,              //是否双向匹配搜索。为 true 即输入关键字包含或包含于匹配字段均认为匹配成功，为 false 则输入关键字包含于匹配字段认为匹配成功

    multiWord: false,               //以分隔符号分割的多关键字支持
    separator: ',',                 //多关键字支持时的分隔符，默认为半角逗号
    delay: 300,                     //搜索触发的延时时间间隔，单位毫秒

    /* UI */
    autoDropup: false,              //选择菜单是否自动判断向上展开。设为 true，则当下拉菜单高度超过窗体，且向上方向不会被窗体覆盖，则选择菜单向上弹出
    autoMinWidth: false,            //是否自动最小宽度，设为 false 则最小宽度不小于输入框宽度
    showHeader: false,              //是否显示选择列表的 header。为 true 时，有效字段大于一列则显示表头
    showBtn: true,                  //是否显示下拉按钮
    inputBgColor: '',               //输入框背景色，当与容器背景色不同时，可能需要该项的配置
    inputWarnColor: 'rgba(255,0,0,.1)', //输入框内容不是下拉列表选择时的警告色
    listStyle: {
        'padding-top': 0,
        'max-height': '375px',
        'max-width': '800px',
        'overflow': 'auto',
        'width': 'auto',
        'transition': '0.3s',
        '-webkit-transition': '0.3s',
        '-moz-transition': '0.3s',
        '-o-transition': '0.3s'
    },                              //列表的样式控制
    listAlign: 'left',              //提示列表对齐位置，left/right/auto
    listHoverStyle: 'background: #07d; color:#fff', //提示框列表鼠标悬浮的样式
    listHoverCSS: 'jhover',         //提示框列表鼠标悬浮的样式名称
    clearable: false,               // 是否可清除已输入的内容

    /* key */
    keyLeft: 37,                    //向左方向键，不同的操作系统可能会有差别，则自行定义
    keyUp: 38,                      //向上方向键
    keyRight: 39,                   //向右方向键
    keyDown: 40,                    //向下方向键
    keyEnter: 13,                   //回车键

    /* methods */   
    fnProcessData: processData,     //格式化数据的方法，返回数据格式参考 data 参数
    fnGetData: getData,             //获取数据的方法，无特殊需求一般不作设置
    fnAdjustAjaxParam: null,        //调整 ajax 请求参数方法，用于更多的请求配置需求。如对请求关键字作进一步处理、修改超时时间等
    fnPreprocessKeyword: null       //搜索过滤数据前，对输入关键字作进一步处理方法。注意，应返回字符串
};