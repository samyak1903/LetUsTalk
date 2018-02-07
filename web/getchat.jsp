<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,com.webchat.*, java.text.*"%>
<%
    String profileName = session.getAttribute("user").toString();
    String roomName = session.getAttribute("roomName").toString();
    HashMap<String, ChatRoom> roomList = (HashMap<String, ChatRoom>) application.getAttribute("roomList");
    ChatRoom room = roomList.get(roomName);
%>
<%
    for (Iterator iterator = room.iterator(); iterator.hasNext();) {
        ChatRoomEntry chatentry = (ChatRoomEntry) iterator.next();
%>
<p><%= chatentry.getProfileName()%> (<%= chatentry.getTime()%>) : <%= chatentry.getMessage()%></p>
<%
    }
%>
