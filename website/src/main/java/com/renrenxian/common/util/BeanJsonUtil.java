package com.renrenxian.common.util;

import java.io.IOException;
import java.io.StringWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.ser.StdSerializerProvider;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * beanTojson工具类
 * 
 * @author xuewuhao
 * 
 */
public class BeanJsonUtil {
	private final static Logger logger = LoggerFactory
			.getLogger(BeanJsonUtil.class);
	private final static ObjectMapper objectMapper;
	static {
		StdSerializerProvider sp = new StdSerializerProvider();
		sp.setNullValueSerializer(new NullSerializer());
		objectMapper = new ObjectMapper(null, sp, null);
		objectMapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS, false);
		objectMapper.setDateFormat(DateFormat.getDateTimeInstance());// 设置自己的格式
		objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
		objectMapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES,
				true);
	}

	public static ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	private static class NullSerializer extends JsonSerializer<Object> {

		public void serialize(Object value, JsonGenerator jgen,
				SerializerProvider provider) throws IOException,
				JsonProcessingException {
			jgen.writeString("");
		}
	}

	/**
	 * 将json字符串转换为map
	 * 
	 * @param jsonStr
	 *            要转换的字符串
	 * @return 转换成的map
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonStr(String jsonStr) {
		try {
			return getObjectMapper().readValue(jsonStr, Map.class);
		} catch (Exception e) {
			logger.error("", e);
			throw new RuntimeException(
					"Can not getMapFromJsonStr which jsonStr:" + jsonStr, e);
		}
	}

	/**
	 * 将json字符串转换为map
	 * 
	 * @param jsonStr
	 *            要转换的字符串
	 * @return 转换成的map
	 */
	public static <T> Map<String, T> getMapFromJsonStrEx(String jsonStr) {
		try {
			return getObjectMapper().readValue(jsonStr, 
					new TypeReference<Map<String, T>>() {});
		} catch (Exception e) {
			logger.error("", e);
			throw new RuntimeException(
					"Can not getMapFromJsonStr which jsonStr:" + jsonStr, e);
		}
	}

	
	/**
	 * 将map转换为json字符串
	 * 
	 * @param map
	 *            要转换的map
	 * @return 生成的字符串
	 */
	public static String getJsonFromMap(Map<String, ?> map) {
		try {
			return getObjectMapper().writeValueAsString(map);
		} catch (Exception e) {
			logger.error("", e);
			throw new RuntimeException("Can not getJsonFromMap which map:"
					+ map, e);
		}
	}

	/**
	 * json格式字符串转换为java对象
	 * 
	 * @param content
	 * @param valueType
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static <T> T toBean(String content, Class<T> valueType)
			throws JsonParseException, JsonMappingException, IOException {
		return objectMapper.readValue(content, valueType);
	}

	/**
	 * java对象转换为json格式字符串
	 * 
	 * @param object
	 * @return
	 * @throws IOException
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static String toJson(Object object) throws IOException {
		StringWriter writer = new StringWriter();
		try {
			objectMapper.writeValue(writer, object);
			return writer.toString();
		} catch (Exception e) {
			logger.error("", e);
		} finally {
			writer.close();
		}
		return null;
	}

	/**
	 * bean转换为json ##如果该bean有Date类型字段 传入适当的DateFormat实例 反之传null##
	 * 
	 * @param obj
	 * @param dateFormat
	 *            DateFormat.getDateInstance() 2012-11-15
	 *            DateFormat.getDateTimeInstance() 2012-11-15 14:57:29
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static String beanToJson(Object obj, DateFormat dateFormat)
			throws JsonGenerationException, JsonMappingException, IOException {

		if (dateFormat != null) {
			// 关闭时间戳输出，此时是ISO格式
			objectMapper.configure(
					SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS,
					false);
			objectMapper.setDateFormat(dateFormat);// 设置自己的格式
		}
		String value = objectMapper.writeValueAsString(obj);
		return value;
	}

	public static void main(String args[]) {

		DateFormat df1 = null; // 声明一个DateFormat

		DateFormat df2 = null; // 声明一个DateFormat

		df1 = DateFormat.getDateInstance(); // 得到日期的DateFormat对象

		df2 = DateFormat.getDateTimeInstance(); // 得到日期时间的DateFormat对象

		System.out.println("DATE：" + df1.format(new Date())); // 按照日期格式化
																// DATE：2012-11-15

		System.out.println("DATETIME：" + df2.format(new Date())); // 按照日期时间格式化
																	// DATETIME：2012-11-15
																	// 14:57:29

	}

}
