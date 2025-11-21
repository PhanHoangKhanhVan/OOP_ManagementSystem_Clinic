package com.vet.controller;

import com.vet.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Lấy dữ liệu từ Form gửi lên
        String u = request.getParameter("user");
        String p = request.getParameter("pass");
        String r = request.getParameter("role"); // lấy role từ ô select

        // 2. Kiểm tra đăng nhập _ kết nối Database ở đây
        if (u != null && p.equals("123")) { //pass mac dinh la 123
            
            // 3. Tạo đối tượng User giả lập
            User account = new User(1, u, "Nguyen Van A", r, "Ho Chi Minh City");
            
            // 4. Lưu vào Session (Để biết đã login)
            HttpSession session = request.getSession();
            session.setAttribute("acc", account);
            
            // 5. Điều hướng dựa trên Role
            if(r.equals("CLIENT")) {
                // Nếu là khách -> Chuyển sang trang Profile
                response.sendRedirect("views/client/profile.jsp");
            } else if (r.equals("DOCTOR")) {
                // Nếu là bác sĩ -> Chuyển sang trang Lịch làm việc
                response.sendRedirect("views/doctor/schedule.jsp");
            } else {
                // Mặc định về trang chủ
                response.sendRedirect("index.jsp");
            }
            
        } else {
            // 6. Sai pass -> bao loi
            request.setAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu! (Thử pass: 123)");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Login
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}