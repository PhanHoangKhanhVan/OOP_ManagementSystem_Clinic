package com.vet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet này xử lý cả 2 đường dẫn
@WebServlet(name = "PageController", urlPatterns = {"/intro", "/services"})
public class PageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        
        if (path.equals("/intro")) {
            request.getRequestDispatcher("/views/client/intro.jsp").forward(request, response);
        } 
        else if (path.equals("/services")) {
            request.getRequestDispatcher("/views/client/services.jsp").forward(request, response);
        }
    }
}