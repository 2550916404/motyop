/**
 * Project Name:dt47_ssm_maven
 * File Name:GlobalFilter.java
 * Package Name:cn.java.filters
 * Date:2018年1月8日上午10:36:52
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Description: <br/>
 * Date: 2018年1月8日 上午10:36:52 <br/>
 * 
 * @author CLH
 * @version
 * @see
 */
public class GlobalFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        Object object = req.getSession().getAttribute("username");
        if (object != null) {
            chain.doFilter(request, response);
            System.out.println(object);
        } else {
            System.out.println(object);
            request.getRequestDispatcher("/pages/front/login2.jsp").forward(request, response);
        }

    }

    @Override
    public void destroy() {

        // Auto-generated method stub
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        // Auto-generated method stub
    }

}
