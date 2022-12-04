package com.poly.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.DAO.NguoiDungDAO;
import com.poly.Entity.NguoiDungs;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// req.setAttribute("show", "true");
//		req.setAttribute("status", "danger");	
//  		req.setAttribute("message", "Vui");
		req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String tenDN = req.getParameter("tenDN");
		String Ho = req.getParameter("ho");
		String Ten = req.getParameter("ten");
		String Email = req.getParameter("email");
		String matKhau = req.getParameter("matKhau");
		String xacNhan = req.getParameter("xacNhan");
		String dieuKhoan = req.getParameter("dieuKhoan");

		int i = 0;
		if (i == 0) {
			if (Ho.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Họ không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 1) {
			if (Ten.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Tên không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 2) {
			if (tenDN.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Tên đăng nhập không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				if (tenDN.length() < 6 || tenDN.length() > 15) {
					doFill(req, resp);
					req.setAttribute("backround", "danger");
					req.setAttribute("message", "Tên đăng nhập phải từ 6-15 ký tự!");
					req.setAttribute("show", "true");
				} else {
					NguoiDungDAO dao = new NguoiDungDAO();
					NguoiDungs entity = new NguoiDungs();
					entity = dao.findById(tenDN);
					if (entity != null) {
						doFill(req, resp);
						req.setAttribute("backround", "danger");
						req.setAttribute("message", "Tên đăng nhập đã tồn tại!");
						req.setAttribute("show", "true");
					} else {
						doFill(req, resp);
						i++;
					}
				}
//				doFill(req, resp);
//				i++;
			}
		}
		if (i == 3) {
			if (Email.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Email không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				String remail = "\\w+@\\w+\\.\\w+";
				if (Email.matches(remail) == false) {
					doFill(req, resp);
					req.setAttribute("backround", "danger");
					req.setAttribute("message", "Email không đúng!");
					req.setAttribute("show", "true");
				} else {
					doFill(req, resp);
					i++;
				}
			}
		}
		if (i == 4) {
			if (matKhau.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Mật khẩu không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				if (matKhau.length() < 7) {
					doFill(req, resp);
					req.setAttribute("backround", "danger");
					req.setAttribute("message", "Mật khẩu ít nhất 7 ký tự!");
					req.setAttribute("show", "true");
				} else {
					doFill(req, resp);
					i++;
				}

			}
		}
		if (i == 5) {
			if (xacNhan.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Xác nhận mật khẩu không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				if (xacNhan.equals(matKhau) == false) {
					doFill(req, resp);
					req.setAttribute("backround", "danger");
					req.setAttribute("message", "Xác nhận mật khẩu không khớp!");
					req.setAttribute("show", "true");
				} else {
					doFill(req, resp);
					i++;
				}
			}
		}
		if (i == 6) {
			if (dieuKhoan == null) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Vui lòng xác nhận tài khoản!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 7) {
			try {
				// BeanUtils.populate(entity, req.getParameterMap());
				// System.out.println(matKhau);
//				BeanUtils.populate(entity, req.getParameterMap()); 
				NguoiDungDAO dao = new NguoiDungDAO();
				NguoiDungs entity = new NguoiDungs();
				doFill(req, resp);
				BeanUtils.populate(entity, req.getParameterMap());
//				
				// System.out.println(entity.getTenDN());
				// BeanUtils.populate(entity, req.getParameterMap());
				dao.create(entity);
				req.setAttribute("backround", "success");
				req.setAttribute("message", "Tạo tài khoản thành công!");
				req.setAttribute("show", "true");
				resp.sendRedirect("/WebMovie/views/login.jsp");
			} catch (Exception e) {
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Đăng ký thất bại!");
				req.setAttribute("show", "true");
			}

		}
		// this.doGet(req, resp);
		try {
			req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
		} catch (Exception e) {

		}
	}

	private void doFill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String tenDN = req.getParameter("tenDN");
		String Ho = req.getParameter("ho");
		String Ten = req.getParameter("ten");
		String Email = req.getParameter("email");
		String matKhau = req.getParameter("matKhau");
		String xacNhan = req.getParameter("xacNhan");
		boolean dieuKhoan = Boolean.valueOf(req.getParameter("dieuKhoan"));

		req.setAttribute("Ten", Ten);
		req.setAttribute("Ho", Ho);
		req.setAttribute("tenDN", tenDN);
		req.setAttribute("Email", Email);
		req.setAttribute("matKhau", matKhau);
		req.setAttribute("xacNhan", xacNhan);
		req.setAttribute("dieuKhoan", dieuKhoan);
	}

//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//        req.setCharacterEncoding("UTF-8");
//        resp.setCharacterEncoding("UTF-8");
//        
//        String Ho = req.getParameter("Ho");
//        String Ten = req.getParameter("Ten");
//        String tenDN = req.getParameter("tenDN");
//        String Email = req.getParameter("Email");
//        String matKhau = req.getParameter("matKhau");
//        String xacNhan = req.getParameter("xacNhan");
//        boolean dieuKhoan = Boolean.parseBoolean(req.getParameter("dieuKhoan"));
//        
//        int i = 0;
//        if(i == 0) {
//        	if(Ho.matches(null)) {
//        		req.setAttribute("message", "Vui lÃ²ng nháº­p Há»�!");
//        	}
//        	else {
//        		i++;
//        	}
//        }
////        System.out.println(Ho);
//        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
//        
//	}

}
