package com.renrenxian.util.result;

/**
 * 基础返回bean code: 0 正常，非0为异常 msg: 异常信息 前端提示用（***）描述，如果无需前端显示用（无）表示
 */
public class BaseResult {

	private int code;

	private String msg;

	/**
	 * 成功（无）
	 */
	public static final BaseResult SUCCESS = new BaseResult(0, "成功");

	/**
	 * 失败（无）
	 */
	public static final BaseResult FAILED = new BaseResult(1, "失败");
	/**
	 * 失败（网络或服务异常，请稍后再试）
	 */
	public static final BaseResult SAVE_FAILED = new BaseResult(19, "网络或服务异常，请稍后再试");

	/**
	 * 无效参数（无）
	 */
	public static final BaseResult INVALID_PARAMETER = new BaseResult(2, "无效参数");

	/**
	 * 无此方法（无）
	 */
	public static final BaseResult NO_SUCH_METHOD = new BaseResult(3, "无此方法");

	/**
	 * 签名失败（无）
	 */
	public static final BaseResult INVALID_SIGN = new BaseResult(4, "验证签名失败");

	/**
	 * 尚未登录（请重新登录后再试）
	 */
	public static final BaseResult NO_LOGIN = new BaseResult(5, "请重新登录后再试");

	/**
	 * 无效用户名密码（帐号或密码错误，请重新输入）
	 */
	public static final BaseResult INVALID_USERNAME_PWD = new BaseResult(6, "帐号或密码错误，请重新输入");

	/**
	 * 用户不匹配（无）
	 */
	public static final BaseResult UID_MISMATCHED = new BaseResult(7, "用户不匹配");

	/**
	 * 请求头不符合要求（请求来源非法）
	 */
	public static final BaseResult REFERER_MISMATCHED = new BaseResult(8, "请求来源非法");

	/**
	 * 无效时间（无）
	 */
	public static final BaseResult INVALID_DATETIME = new BaseResult(9, "无效时间");

	/**
	 * 非法请求（非法请求）
	 */
	public static final BaseResult ILLEGAL_REQUEST = new BaseResult(10, "非法请求");

	/**
	 * 服务器错误（网络或服务异常，请稍后再试）
	 */
	public static final BaseResult SERVICE_ERROR = new BaseResult(12, "网络或服务异常，请稍后再试");

	/**
	 * 任务运行中（无）
	 */
	public static final BaseResult HAVE_TASK_ON = new BaseResult(13, "任务运行中");

	/**
	 * 记录不存在（发言已被删除）/（评论已被删除）
	 */
	public static final BaseResult NO_RECORD = new BaseResult(14, "发言已被删除/评论已被删除");

	/**
	 * 重复操作（无）
	 */
	public static final BaseResult REPEAT_OPERATE = new BaseResult(15, "重复操作");

	
	/**
	 * 验证码不正确（验证码错误）
	 */
	public static final BaseResult CODE_NOT_CORRECT = new BaseResult(17, "验证码错误");

	
	/**
	 * 用户不存在（该帐号尚未注册）
	 */
	public static final BaseResult USER_NOT_Exsit = new BaseResult(1001, "该帐号尚未注册");

	/**
	 * 用户已存在（手机号已注册）/（邮箱已注册）
	 */
	public static final BaseResult USER_Exsit = new BaseResult(1002, "手机号已注册/邮箱已注册");
	
	/**
	 * 用户姓名不存在（无）
	 */
	public static final BaseResult USER_NAME_EMPTY = new BaseResult(1002, "用户姓名不存在");

	
	public BaseResult() {
	}

	public BaseResult(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "BaseResult [code=" + code + ", msg=" + msg + "]";
	}

}
