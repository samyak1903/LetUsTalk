<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="com.webchat.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>LetUsTalk.com/Admin Console/Configuring Chat Rooms</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <table width="900" height="550" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
            <tr>
                <td width="200" rowspan="2" valign="top">
                    <%@ include file="menu.jsp"%> 
                </td>
                <td height="550" bgcolor="#476BC0" valign="top">
                    <br>
                    <br>
                    <table align="center"><tr align="center">
                            <td height="25" width="120" bgcolor="#728DCF"><a href="adduser.jsp">Add Users</td>
                            <td height="25" width="120" bgcolor="#728DCF"><a href="viewuser.jsp">View Users</a></td>
                            <td height="25" width="120" bgcolor="#993366">Configure Rooms</td>
                            <td height="25" width="120" bgcolor="#728DCF"><a href="secure?action=logout">Logout</a></td></tr></table>
                    <br><br><br>
                    <form method="post" action="RoomServlet">
                        <%
                            HashMap<String,ChatRoom> hashmap = (HashMap<String,ChatRoom>) getServletContext().getAttribute("roomList");
                            if (hashmap != null) {
                                Iterator iterator = hashmap.keySet().iterator();
                                if (!iterator.hasNext()) {
                                    out.println("No Room Configured.");
                                } else {
                                    out.println("To Remove a Room check it and press Update RoomList");
                                    ChatRoom chatroom;
                                    for (; iterator.hasNext(); ) {
                                        out.println("<br>");
                                        String s = (String) iterator.next();
                                        chatroom = (ChatRoom) hashmap.get(s);
                                        out.println("<br><input type=checkbox name=remove value='" + chatroom.getRoomName() + "'>" + chatroom.getRoomName());
                                        out.println(" :- "+chatroom.getRoomDesc());                                      
                                    }
                                }
                            }
                        %>
                        <p align="center">Enter Name and Description for new Chat Room.</p>
                        <table align="center" bgcolor="#728DCF">
                            <tr>
                                <td>Name</td>
                                <td><input name=roomname size=25 class="smalltext"></td>
                            </tr>
                            <tr>
                                <td >Subject</td>
                                <td><textarea name=roomdescr cols=25 rows=4 class="smalltext"></textarea></td>
                            </tr>
                        </table>
                        <p>&nbsp;</p>
                        <div align="center">
                            <input type=submit value="Update RoomList">
                        </div>
                    </form>
                </td>
            </tr>
            <tr><td align="center">&nbsp;</td></tr></table> 
    </body></html>
