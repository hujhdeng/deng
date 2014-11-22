var starttime = '';
/**
 * 申请发送短信验证码
 * @param {} reg_phonetmp 接收短信的验证码
 */
function getyzm(phonetmp) {
	if (phonetmp == '') {
		alert('请输入手机号');
	} else {
		myDate = new Date();
		nowtime = myDate.getMinutes();
		if (Math.abs(starttime - nowtime) < 10 && starttime != '') {
			alert('验证码已发送，请稍后再试');
		} else {
			$.jsonP({
						url : apiPath+'/user/yzm/sendSms?phone='+phonetmp+'&callback=?',
						success : function(data) {
							if (data.apicode == 10000) {
								starttime = nowtime;
								alert("验证码已发送到你的手机，请注意查收！");
							} else {
								alert("验证码发送失败，请稍后再试！");

							}
						}
					});

		}
	}
}

/**
 * 找回密码
 * @param {} findphone 手机号
 * @param {} findyzm 手机短信验证码
 * @param {} findpwd 新密码
 */
function wxresetpwd(findphone,findyzm,findpwd) {
	if (findphone == '') {
		alert('请重新输入手机号获取验证码！');
	} else if (findyzm == '') {
		alert('请输入手机收到的验证码！');
	} else if (findpwd == '') {
		alert('请输入密码！');
	} else {
		$.jsonP({
			url : apiPath+'/user/updatepwd?phone='+findphone+'&yzm='+findyzm+'&password='+findpwd+'&callback=?',
			success : function(data) {
				if (data.apicode == 10000) {
					alert("密码修改成功,请使用app登录！");
					if($("#home").length>0){
						$.ui.loadContent('#home');
					}
					$('#findyzm').val(""); 
					$('#findpwd').val("");
				} else {
					alert(data.message);

				}
			}
		});

	}
}

/**
 * 注册新用户
 * @param {} reg_phone 注册手机号
 * @param {} yzm 手机短信验证码
 * @param {} reg_u_pwd 注册密码
 */
function wxreg(reg_phone,yzm,reg_u_pwd) {
	if (reg_phone == '' || reg_phone == null) {
		alert('请重新输入手机号获取验证码！');
	} else if (yzm == '') {
		alert('请输入手机收到的验证码！');
	} else if (reg_u_pwd == '') {
		alert('请输入密码！');
	} else {
		$.jsonP({
			url : apiPath+'/user/reg?phone='+reg_phone+'&yzm='+yzm+'&password='+reg_u_pwd+'+&callback=?',
			success : function(data) {
				alert(data.apicode);
				if (data.apicode == 10000) {
					alert("注册成功！");
					window.location.href = apiPath+'/down';
				} else {
					alert(data.message);
				}
			}
		});

	}
}

function findpwd() {
	$.ui.loadContent('#t2');
}

/**
 * 登陆并且申请加入甩单/聚会
 * @param {} sid 甩单/聚会id
 * @param {} message 接单留言（type为sdan或者缺省时需要；type为party时，message不需要）
 * @param {} phone 手机
 * @param {} u_pwd 登陆密码
 */
function userlog(sid,message,phone,u_pwd,type) {
	if (phone == '') {
		alert('请输入电话号码');
	} else if (u_pwd == '') {
		alert('请输入密码');
	} else {
		type = type ||"sdan";
		var the_url = apiPath+'/'+type+'/wxlogjoin?id='+sid+'&phone='+phone +'&u_pwd='+u_pwd;
		var sucmes = "报名成功！";
		if(type=="sdan"){
			the_url += '&message='+message;
			sucmes = "接单留言成功！";
		}
		the_url += '&callback=?';
		alert(the_url);
		$.jsonP({
			url : the_url,
			success : function(data) {
				alert(data.apicode);
				if (data.apicode == 10000) {
					alert(sucmes);
					window.location.href = apiPath+'/down';
				} else {
					alert(data.message);
				}
			}
		});

	}
}