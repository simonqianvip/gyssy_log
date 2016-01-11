package com.itheima.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.itheima.domain.User;
import com.itheima.service.UserService;

public class LoginServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserService service = new UserService();
		try{
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());
		if(service.isUser(user)){
			System.out.println(user.getUsername()+",登陆成功！");
			request.getSession().setAttribute("username", user.getUsername());
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			request.setAttribute("msg", "用户名或者密码不正确请重新登陆...");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
