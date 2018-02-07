package com.webchat;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChatRoomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            HttpSession session = request.getSession();
            String roomName = request.getParameter("roomName");
            if(roomName==null){
                RequestDispatcher view = request.getRequestDispatcher("/roomlist.jsp");
                view.forward(request, response);
            }else{
                session.setAttribute("roomName", roomName);
                RequestDispatcher view = request.getRequestDispatcher("/showchat.jsp");
                view.forward(request, response);
            }
        }else if(action.equals("exit")){
            RequestDispatcher view = request.getRequestDispatcher("/roomlist.jsp");
            view.forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
