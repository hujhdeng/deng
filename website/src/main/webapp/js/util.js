var starttime = '';
var reg_phone = '';
var findstarttime = '';
var findphone = '';
function sendfindyzm(findphonetmp) {
	//findphonetmp = $('#findphone').val();
	if (findphonetmp == '') {
		alert('请输入手机号');
	} else {
		findmyDate = new Date();
		findnowtime = findmyDate.getMinutes();
		// alert(starttime+'-'+nowtime)
		if (Math.abs(findstarttime - findnowtime) < 10 && findstarttime != '') {
			alert('验证码已发送，请稍后再试');
		} else {

			$.jsonP({
						url : 'http://www.jucaicun.com/user/yzm/sendSms?phone='+findphonetmp+'&callback=?',
						success : function(data) {
							if (data["apicode"] == '10000') {
								findstarttime = findnowtime;
								findphone = findphonetmp;
								alert("验证码已发送到你的手机，请注意查收！");
							} else {
								alert("验证码发送失败，请稍后再试！");

							}
						}
					});

		}
	}
}

function getyzm(reg_phonetmp) {
	//reg_phonetmp = $('#reg_phone').val();
	if (reg_phonetmp == '') {
		alert('请输入手机号');
	} else {
		myDate = new Date();
		nowtime = myDate.getMinutes();
		// alert(starttime+'-'+nowtime)
		if (Math.abs(starttime - nowtime) < 10 && starttime != '') {
			alert('验证码已发送，请稍后再试');
		} else {

			$.jsonP({
						url : 'http://www.jucaicun.com/user/yzm/sendSms?phone='+reg_phonetmp+'&callback=?',
						success : function(data) {
							if (data["apicode"] == '10000') {
								starttime = nowtime;
								reg_phone = reg_phonetmp;
								alert("验证码已发送到你的手机，请注意查收！");
							} else {
								alert("验证码发送失败，请稍后再试！");

							}
						}
					});

		}
	}
}
function wxresetpwd(findphone,findyzm,findpwd) {
	//findyzm = $('#findyzm').val();
	//findpwd = $('#findpwd').val();
	if (findphone == '') {
		alert('请重新输入手机号获取验证码！');
	} else if (findyzm == '') {
		alert('请输入手机收到的验证码！');
	} else if (findpwd == '') {
		alert('请输入密码！');
	} else {
		$.jsonP({
			url : 'http://www.jucaicun.com/user/updatepwd?phone='+findphone+'&yzm='+findyzm+'&password='+findpwd+'&callback=?',
			success : function(data) {
				if (data["apicode"] == '10000') {
					alert("恭喜密码修改成功,请使用新密码登录！");
					findphone = '';
					$('#findyzm').val(""); 
					$('#findpwd').val("");
				} else {
					alert(data["data"]["message"]);

				}
			}
		});

	}
}

function wxreg(reg_phone,yzm,reg_u_pwd) {
	// alert(reg_phone)
	//yzm = $('yzm').val();
	//reg_u_pwd = $('reg_u_pwd').val();

	if (reg_phone == '' || reg_phone == null) {
		alert('请重新输入手机号获取验证码！');
	} else if (yzm == '') {
		alert('请输入手机收到的验证码！');
	} else if (reg_u_pwd == '') {
		alert('请输入密码！');
	} else {

		$.jsonP({
			url : 'http://www.jucaicun.com/app/jcc_act2.php?act=wx_userreg&phone='+reg_phone+'&yzm='+yzm+'&u_pwd='+reg_u_pwd+'+&callback=?',
			success : function(data) {
				if (data["apicode"] == '10000') {
					alert("恭喜你注册成功！");
				} else {
					alert(data["data"]["message"]);

				}
			}
		});

	}
}

function findpwd() {
	$.ui.loadContent('#t2');
}
function reg() {
	$.ui.loadContent('#t3');
}

function userlog(sid,message,phone,u_pwd) {
	//phone =$('#phone').val();
	//u_pwd = $('#u_pwd').val();
	if (phone == '') {
		alert('请输入电话号码');
	} else if (u_pwd == '') {
		alert('请输入密码');
	} else {

		$.jsonP({
			url : 'http://www.jucaicun.com/sdan/wxlogjoin?id='+sid+'&message='+message+'&phone='+phone +'&u_pwd='+u_pwd +'&callback=?',
			success : function(data) {
				if (data["apicode"] == '10000') {
					alert("接单留言成功！");
					window.location.href = '/down';
				} else {
					alert(data["data"]["message"]);
				}
			}
		});

	}
}