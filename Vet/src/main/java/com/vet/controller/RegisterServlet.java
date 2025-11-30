package com.vet.controller;

import com.vet.dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng đến file register
        request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // Lấy dữ lịu
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        
        // gán null
        String email = ""; 
        String address = ""; 

        UserDAO dao = new UserDAO();

        // ktra
        if (dao.checkUsername(user)) {
            request.setAttribute("mess", "Username already use");
            request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
            return;
        }

        // gọi signup
        dao.signup(user, pass, fullName, phone, email, address);
        
        // success
        request.setAttribute("mess", "Success! Log in now");
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}