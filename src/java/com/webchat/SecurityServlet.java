package com.webchat;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SecurityServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("loginfail.jsp");
            rd.forward(request, response);
        } else if (action.equals("login")) {
            String loginid = request.getParameter("loginid");
            String password = request.getParameter("password");
            String type = request.getParameter("type");
            String name = DBManager.authenticateUser(loginid, password, type);
            if (name == null) {
                RequestDispatcher rd = request.getRequestDispatcher("loginfail.jsp");
                rd.forward(request, response);
            } else {
                session.setAttribute("login", "true");
                session.setAttribute("type", type);
                session.setAttribute("user", name);
                session.setAttribute("loginid", loginid);
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            }
        } else if (action.equals("logout")) {
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("webchat");
            rd.forward(request, response);
        } else if (action.equals("addUser")) {
            String name = (String) request.getParameter("name");
            String email = (String) request.getParameter("email");
            String loginid = (String) request.getParameter("loginid");
            String password = (String) request.getParameter("password");
            String type = (String) request.getParameter("type");
            int x = DBManager.addUser(loginid, password, type, name, email);
            if (x == 1) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "error");
            }
            RequestDispatcher rd = request.getRequestDispatcher("adduser.jsp");
            rd.forward(request, response);
        }else if (action.equals("delete")) {
            String[] names=request.getParameterValues("loginid");
            if (names!=null){	
                for(int i=0;i<names.length;i++){
                    DBManager.deleteUser(names[i]);
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher("viewuser.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
