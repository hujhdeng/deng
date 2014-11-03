package com.renrenxian.manage.mybatis;

/**
 * 条件查询封装器，只能是简单的查询封装
 * @author hujihong
 * key symbol value connect key symbol value
 */
public class WhereWrapper {

	// GE是大于等于号（>=），GT是大于号(>)，LE是小于等于号(<=),LT是小于号(<),EQ是等于号(=)
	public final static String SYMBOL_EQ = "=";
	public final static String SYMBOL_GE = ">=";
	public final static String SYMBOL_GT = ">";
	public final static String SYMBOL_LE = "<=";
	public final static String SYMBOL_LT = "<";
	// 不等于
	public final static String SYMBOL_NE = "!=";
	// 如 is null
	public final static String SYMBOL_IS = "is";
	// 如 is not null
	public final static String SYMBOL_ISNOT = "is not";
	
	// 存在
	public final static String SYMBOL_EXISTS = "exists"; 
	public final static String SYMBOL_NOTEXISTS = "not exists"; 
	
	// 存在
	public final static String SYMBOL_IN = "in"; 
	public final static String SYMBOL_NOTIN = "not in";
	
	public final static String SYMBOL_LIKE = "like";
	
	
	// 条件字段 （数据库字段名)
	private String key;
	
	// 字段的值  如果是 in（exist、not exist) 方式查找 value 是集合
	private Object value;
	
	// 连接key 与 value的中间符号部分（> = < is not  ) in（exist、not exist)
	private String symbol;
	
	// 与 下一个条件连接时，中是的字符，如 and or 等
	// 多个时，最后一个不需要填写
	private String connect;

	public WhereWrapper() {
		super();
	}
	
	public WhereWrapper(String key, String symbol, Object value, String connect) {
		this.key = key;
		this.value = value;
		this.symbol = symbol;
		this.connect = connect;
	}
	public WhereWrapper(String key, String symbol, Object value) {
		this.key = key;
		this.value = value;
		this.symbol = symbol;
		
	}
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getConnect() {
		return connect;
	}

	public void setConnect(String connect) {
		this.connect = connect;
	}


	
	
	
}
