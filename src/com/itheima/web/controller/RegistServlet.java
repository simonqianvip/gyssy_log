package com.itheima.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.itheima.domain.User;
import com.itheima.exception.CheckDataException;
import com.itheima.service.UserService;

public class RegistServlet extends HttpServlet {
	private UserService service = new UserService();
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		//1.验证验证码
		HttpSession session = request.getSession(false);
		if(session==null || session.getAttribute("valiStr")==null || !session.getAttribute("valiStr").equals(request.getParameter("valiStr"))){
			request.setAttribute("msg", "验证码不正确！");
			request.getRequestDispatcher("/regist.jsp").forward(request, response);
			return;
		}
		//2.封装数据到bean
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());
		
		//3.校验数据
		user.valiDate();
		
		//4.校验用户名是否已经使用！调用service注册用户
//		if(service.hasName(user.getUsername())){
//			request.setAttribute("msg", "用户名已经存在！");
//			request.getRequestDispatcher("/regist.jsp").forward(request, response);
//			return;
//		}
//		service.registUser(user);
		//5.在session中保存登录状态
		request.getSession().setAttribute("username", user.getUsername());
		//6.重定向到首页
		response.sendRedirect(request.getContextPath()+"/homepage.jsp");
		
		}catch (CheckDataException e) {//校验出问题回到注册页面提示问题
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("/regist.jsp").forward(request, response);
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
