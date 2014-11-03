package com.renrenxian.manage.mybatis;

/**
 * 排序的封装类
 * @author hujihong
 *
 */
public class SortWrapper {
	
	public final static String ASC = "asc"; // 升序
	public final static String DESC = "desc"; // 降序
	
	
	
	// 排序的字段 (一定要是数据库里的字段名称)
	private String key;
	
	// 升、降序
	private String value;

	public SortWrapper() {
	}
	
	public SortWrapper(String key, String value) {
		this.key = key;
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}


	
}
