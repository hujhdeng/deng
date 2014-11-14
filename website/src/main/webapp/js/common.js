// JavaScript Document

//网站的主域名
var serverURL = 'http://www.phonegap100.com';

/*
写入loclstorage缓存
 * @param key
 * @param data
*/
function setItem(key,data){
	localStorage.setItem(key,data);
}
/*
读取localstorage缓存
  * @param key 
  * @returns
*/
function getItem(key){
	return localStorage.getItem(key);
}


//清除localstorage

function clearItem(key){
	return localStorage.removeItem(key);
}


/**
 * 检查网络情况
 * @returns {Boolean}
 */
function checkConnection() {
	var networkState = navigator.network.connection.type;
	if (networkState == Connection.NONE) {
		navigator.notification.confirm('请确认网络连接已开启,并重试', showAlert, '提示',
				'确定');
		return false;
	}else{
		return true;
	}
}
/*时间戳转换为 2011年3月16日 16:50:43 格式*/
function getDate(tm){
	var tt=new Date(parseInt(tm) * 1000).toLocaleString();
	return tt;
}
//调用 底层接口加密处理
function UserSign(success,error,option){
	cordova.exec(success, error, "Sign", "sign", option);
}	

/*js获取当前的时间戳
var timestamp1 =Date.parse(new Date());  //获取当前时间戳，毫秒部分为000
var timestamp2 = (new Date()).valueOf();  //获取完整时间戳
var timestamp3=new Date().getTime();  //获取完整时间戳

*/
/*获取时间戳的方法*/
function getTimestamp(){
	var timestamp1 =Date.parse(new Date());
	
	return timestamp1/1000;
}








