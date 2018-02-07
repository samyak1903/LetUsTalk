package com.webchat;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RoomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<String, ChatRoom> roomList = null;
        roomList = (HashMap<String, ChatRoom>) getServletContext().getAttribute("roomList");

        //Delete Rooms
        String rooms[] = request.getParameterValues("remove");
        if (rooms != null) {
            for (int i = 0; i < rooms.length; i++) {
                DBManager.deleteRoom(rooms[i]);
                roomList.remove(rooms[i]);
            }
        }

        //Adding a room.
        String roomname = request.getParameter("roomname");
        String roomdesc = request.getParameter("roomdescr");

        if (roomname != null && roomname.length() > 0) {
            DBManager.addRoom(roomname, roomdesc);
            roomList.put(roomname, new ChatRoom(roomname, roomdesc));
        }
        RequestDispatcher rd = request.getRequestDispatcher("configurerooms.jsp");
        rd.forward(request, response);
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
