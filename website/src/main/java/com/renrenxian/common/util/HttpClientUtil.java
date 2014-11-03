package com.renrenxian.common.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.SocketTimeoutException;
import java.net.URLEncoder;
import java.nio.charset.CodingErrorAction;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.SSLContext;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.MessageConstraints;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * http工具类封装
 *
 */
public class HttpClientUtil {

	private final static Logger logger = LoggerFactory
			.getLogger(HttpClientUtil.class);
	private static PoolingHttpClientConnectionManager poolManager = null;
	private static CloseableHttpClient httpclient = null;
	static {
		try {
			SSLContext sslContext = SSLContexts.createSystemDefault();
			Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder
					.<ConnectionSocketFactory> create()
					.register("http", PlainConnectionSocketFactory.INSTANCE)
					.register("https",
							new SSLConnectionSocketFactory(sslContext)).build();
			poolManager = new PoolingHttpClientConnectionManager(
					socketFactoryRegistry);
					httpclient = HttpClients.custom().setConnectionManager(poolManager).build();
			// Create socket configuration
			SocketConfig socketConfig = SocketConfig.custom()
					.setTcpNoDelay(true).build();
			poolManager.setDefaultSocketConfig(socketConfig);
			// Create message constraints
			MessageConstraints messageConstraints = MessageConstraints.custom()
			.setMaxHeaderCount(200)
			.setMaxLineLength(2000)
			.build();
			// Create connection configuration
			ConnectionConfig connectionConfig = ConnectionConfig.custom()
			.setMalformedInputAction(CodingErrorAction.IGNORE)
			.setUnmappableInputAction(CodingErrorAction.IGNORE)
			.setCharset(Consts.UTF_8)
			.setMessageConstraints(messageConstraints)
			.build();
			poolManager.setDefaultConnectionConfig(connectionConfig);
			poolManager.setMaxTotal(200);
			poolManager.setDefaultMaxPerRoute(20);
		} catch (Exception e) {
			logger.error("", e);
		}
	}

	/**
	 * 参数已json形式的post请求
	 * @param url
	 * @param timeout
	 * @param map
	 * @param encoding
	 * @return
	 */
	public static String postJsonBody(String url, int timeout,
			Map<String, Object> map, String encoding) {
		HttpPost post = new HttpPost(url);
		try {
			post.setHeader("Content-type", "application/json");
			post.setHeader("Referer", "	http://www.gongzuoquan.com/login.html");
			post.setHeader("User-Agent","Mozilla/5.0 (Windows NT 6.2; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0");
			RequestConfig requestConfig = RequestConfig.custom()
			.setSocketTimeout(timeout)
			.setConnectTimeout(timeout)
			.setConnectionRequestTimeout(timeout)
			.setExpectContinueEnabled(false).build();
			post.setConfig(requestConfig);
			String str1 = BeanJsonUtil.getJsonFromMap(map).replace("\\", "");
			post.setEntity(new StringEntity(str1, encoding));
			logger.info("postJsonBody invoke url:" + url + " , params:" + str1);
			CloseableHttpResponse response = httpclient.execute(post);
			try {
				HttpEntity entity = response.getEntity();
				try {
					if (entity != null) {
						String str = EntityUtils.toString(entity, encoding);
						logger.info("postJsonBody url :" + url
								+ " , response string :" + str);
						return str;
					}
				} finally {
					if (entity != null) {
						entity.getContent().close();
					}
				}
			} finally {
				if (response != null) {
					response.close();
				}
			}
		} catch (UnsupportedEncodingException e) {
			logger.error("UnsupportedEncodingException", e);
		} catch (Exception e) {
			logger.error("Exception", e);
		} finally {
			post.releaseConnection();
		}
		return "";

	}

	

	@SuppressWarnings("deprecation")
	public static String invokeGet(String url, Map<String, String> params,
			String encode, int connectTimeout, int soTimeout) {
		String responseString = null;
		RequestConfig requestConfig = RequestConfig.custom()
				.setSocketTimeout(connectTimeout)
				.setConnectTimeout(connectTimeout)
				.setConnectionRequestTimeout(connectTimeout).build();
		StringBuilder sb = new StringBuilder();
		sb.append(url);
		int i = 0;
		for (Entry<String, String> entry : params.entrySet()) {
			if (i == 0 && !url.contains("?")) {
				sb.append("?");
			} else {
				sb.append("&");
			}
			sb.append(entry.getKey());
			sb.append("=");
			String value = entry.getValue();
			try {
				sb.append(URLEncoder.encode(value, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				logger.warn("encode http get params error, value is " + value,
						e);
				sb.append(URLEncoder.encode(value));
			}
			i++;
		}
		logger.info("invokeGet begin invoke:" + sb.toString());
		HttpGet get = new HttpGet(sb.toString());
		get.setConfig(requestConfig);
		try {
			CloseableHttpResponse response = httpclient.execute(get);
			try {
				HttpEntity entity = response.getEntity();
				try {
					if (entity != null) {
						responseString = EntityUtils.toString(entity, encode);
					}
				} finally {
					if (entity != null) {
						entity.getContent().close();
					}
				}
			} catch (Exception e) {
				logger.error(
						String.format("invokeGet response error, url:%s",
								sb.toString()), e);
				return responseString;
			} finally {
				if (response != null) {
					response.close();
				}
			}
			logger.info(String.format("invokeGet url:%s , response string %s:",
					sb.toString(), responseString));
		} catch (SocketTimeoutException e) {

			logger.error(
					String.format("invokeGet timout error, url:%s",
							sb.toString()), e);

			return responseString;

		} catch (Exception e) {

			logger.error(
					String.format("invokeGet error, url:%s", sb.toString()), e);
		} finally {
			get.releaseConnection();
		}
		return responseString;
	}

	public final static int connectTimeout = 5000;

	/**
	 * 
	 * HTTPS请求，默认超时为5S
	 * 
	 * @param reqURL
	 * 
	 * @param params
	 * 
	 * @return
	 */

	public static String connectPostHttps(String reqURL,
			Map<String, String> params) {
		String responseContent = null;
		HttpPost httpPost = new HttpPost(reqURL);
		try {
			RequestConfig requestConfig = RequestConfig.custom()
			.setSocketTimeout(connectTimeout)
			.setConnectTimeout(connectTimeout)
			.setConnectionRequestTimeout(connectTimeout).build();

			List<NameValuePair> formParams = new ArrayList<NameValuePair>();
			httpPost.setEntity(new UrlEncodedFormEntity(formParams,
					Consts.UTF_8));
			httpPost.setConfig(requestConfig);
			// 绑定到请求 Entry
			for (Map.Entry<String, String> entry : params.entrySet()) {

				formParams.add(new BasicNameValuePair(entry.getKey(), entry
						.getValue()));
			}

			CloseableHttpResponse response = httpclient.execute(httpPost);
			try {
				// 执行POST请求
				HttpEntity entity = response.getEntity(); // 获取响应实体
				try {
					if (null != entity) {
						responseContent = EntityUtils.toString(entity,
								Consts.UTF_8);
					}
				} finally {
					if (entity != null) {
						entity.getContent().close();
					}
				}
			} finally {
				if (response != null) {
					response.close();
				}
			}
			logger.info("requestURI : " + httpPost.getURI()
					+ ", responseContent: " + responseContent);
		} catch (ClientProtocolException e) {
			logger.error("ClientProtocolException", e);
		} catch (IOException e) {
			logger.error("IOException", e);
		} finally {
			httpPost.releaseConnection();
		}
		return responseContent;

	}

	
	public static void main(String args[]){
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user", "haoxw%40chanjet.com");
		params.put("password", "5c952c19dbff4d7e18ef140c1a42ea47");
		for(int i=0;i<100;i++)
		HttpClientUtil.postJsonBody("http://www.gongzuoquan.com/signin", 10000, params, "utf-8");
		
		
//		Map<String, Object> params2 = new HashMap<String, Object>();
//		params2.put("username", "郝学武");
//		params2.put("userid", "60003719470");
//		params2.put("topicid", "533f954a11d295fcac1ce86f");
//		params2.put("teamid", "262");
//		params2.put("detail", "评论数&gt;=3就会出现");
//		
//		HttpClientUtil.postJsonBody("http://gongzuoquan.com/comment/add", 10000, params2, "utf-8");
		
	}
}
