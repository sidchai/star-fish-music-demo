package com.softeem.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

public class LoginAdminFilter implements Filter {
    private String notFilterURL;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //分割不需要过滤的页面
        String[] notFilterUrlBuf = notFilterURL.split(";");
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        //得到访问路径
        String path = uri.substring(contextPath.length());
        //判定是否是可以直接访问的页面
        if (Arrays.asList(notFilterUrlBuf).contains(path)) {
            //如果是则直接放行
            chain.doFilter(req, resp);
            return;
        }
        //判定是否登录了
        if (session.getAttribute("ADMIN_INFO") != null) {
            chain.doFilter(req, resp);
        } else {
            response.sendRedirect(request.getContextPath()+"/adminLogin.jsp");
        }
    }

    public void init(FilterConfig config) throws ServletException {
        notFilterURL = config.getInitParameter("notFilterURL");
    }

}
