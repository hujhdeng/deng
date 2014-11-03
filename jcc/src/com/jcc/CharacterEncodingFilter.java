package com.jcc;
//
//在Java Web项目中总会遇到编码格式问题，在JSP/Servlet与浏览器传输数据时，处理编码格式的方式通常是设置request对象和response对象的编码格式。然而，一个项目中有很多个JSP/Servlet，在每个JSP/Servlet中分别对request对象和response对象进行编码格式的设置是一件非常麻烦的事情，于是我们想能不能把对于request对象和response对象编码格式的设置统一起来做。
//用过滤器解决统一设置编码格式的问题
//
//    定义一个过滤器类CharacterEncodingFilter

    	
     
    import java.io.IOException;
    import javax.servlet.Filter;
    import javax.servlet.FilterChain;
    import javax.servlet.FilterConfig;
    import javax.servlet.ServletException;
    import javax.servlet.ServletRequest;
    import javax.servlet.ServletResponse;
     
    public class CharacterEncodingFilter implements Filter {
     
        protected FilterConfig filterConfig = null;
        protected String encoding = "utf-8";
     
        public void init(FilterConfig filterConfig) throws ServletException {
            this.filterConfig = filterConfig;
            this.encoding = filterConfig.getInitParameter("encoding");
        }
        public void doFilter(ServletRequest request, ServletResponse response,
                FilterChain chain) throws IOException, ServletException {
     
            request.setCharacterEncoding(this.encoding);
            response.setCharacterEncoding(this.encoding);
            response.setContentType("text/html;charset="+this.encoding);
     
            chain.doFilter(request, response);
        }
        public void destroy() {
            this.encoding = null;
            this.filterConfig = null;
        }
    }
//    在项目配置文件web.xml中添加过滤器的配置信息
//
//    	
//        <filter>
//            <description>CharacterEncodingFilter</description>
//            <display-name>CharacterEncodingFilter</display-name>
//            <filter-name>CharacterEncodingFilter</filter-name>
//            <filter-class>
//                org.zeroup.filter.CharacterEncodingFilter
//            </filter-class>
//            <init-param>
//    <param-name>encoding</param-name>
//    <param-value>utf-8</param-value>
//            </init-param>
//        </filter>
//     
//        <filter-mapping>
//            <filter-name>CharacterEncodingFilter</filter-name>
//            <url-pattern>/*</url-pattern>
//        </filter-mapping>
//
//此例将当前项目中所有request和response对象字符编码格式全部设置为utf-8，同时浏览器端读取和发送数据的编码格式也自动设定为utf-8。
