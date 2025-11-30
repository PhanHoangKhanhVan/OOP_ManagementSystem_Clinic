package com.vet.controller;

import com.vet.dao.UserDAO;
import com.vet.model.Person;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ProfileController", urlPatterns = {"/profile", "/updateProfile"})
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mở trang profile
        request.getRequestDispatcher("/views/client/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Person acc = (Person) session.getAttribute("acc");
        
        if(acc != null) {
            String fullName = request.getParameter("fullname");
            String gender = request.getParameter("gender"); // Lấy gender từ form
            String address = request.getParameter("address");
            
            UserDAO dao = new UserDAO();
            dao.updateUser(acc.getId(), fullName, gender, address);
            
            //Cập nhật lại Session
            acc.setFullName(fullName);
            acc.setAddress(address); 
            acc.setGender(gender);   
            
            session.setAttribute("acc", acc); // Lưu session 
            
            response.sendRedirect("profile");
        }
    }
}