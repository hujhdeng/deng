package com.renrenxian.util.result;

/**
 * 带数据返回
 */
public class DataResult extends BaseResult {

	private Object data;

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public DataResult() {

	}

	public DataResult(int code, String msg, Object data) {
		this.setCode(code);
		this.setMsg(msg);
		this.data = data;
	}

	@Override
	public String toString() {
		return "DataResult [code=" + this.getCode() + ", msg=" + this.getMsg()
				+ ",data=" + data + "]";
	}

	
}
