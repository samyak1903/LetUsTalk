<%@ page contentType="text/html; charset=iso-8859-1" import="java.util.*,com.webchat.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>LetUsTalk! - Select Chat Room</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <table width="900" height="550" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
            <tr>
                <td width="200" rowspan="2" valign="top">
                    <%@ include file="menu.jsp"%> 
                </td>
                <td height="550" bgcolor="#476BC0" align="center" valign="top">
                    <br>
                    <br>
                    <div align="center"><font size="+2">Select Your Room.</font></div>
                    <br /><br />
                    <div align="left">
                        <%
                            DateFormat df = new SimpleDateFormat("EEEE, dd MMMM, yyyy");
                            String date = df.format(new java.util.Date());
                            out.println(date + "&nbsp;&nbsp;<br>");
                            String login = (String) session.getAttribute("login");
                            out.println("User: <font color=yellow>" + (String) session.getAttribute("loginid") + ". <br><a href=secure?action=logout>Logout</a></font>");
                        %></div>
                        <%
                            String s1 = (String) session.getAttribute("profileName");
                        %>
                    <table border="0" align="center">
                        <form method="post" action="ChatRoomServlet">
                            <%
                                HashMap<String,ChatRoom> hashmap = (HashMap<String,ChatRoom>) getServletContext().getAttribute("roomList");
                                if (hashmap.isEmpty()) {
                                    out.println("<tr><td>No Rooms configured.</td></tr>");
                                } else {
                            %>
                            <tr>
                                <td><br />Your Profile Name i.e. "<%=session.getAttribute("user")%>" will be used while chatting.
                                <input name=profileName type="hidden" value="<%=session.getAttribute("user")%>"></td>
                            </tr>
                            <tr><td colspan="2" align="left">Select your Chat Room.</td></tr>
                            <tr><td colspan="2" align="left">
                                    <%
                                        Iterator iterator = hashmap.keySet().iterator();
                                        while (iterator.hasNext()) {
                                            String key = (String) iterator.next();
                                            ChatRoom chatroom = hashmap.get(key);
                                    %>
                                    <br><input type=radio name=roomName value="<%=key%>">
                                    <%= key%>
                                    <%
                                            out.println("<br><div class=smallesttext>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;About: " + chatroom.getRoomDesc() + "</div>");
                                        }
                                    %>
                                </td></tr>
                            <tr><td colspan="2" align="center"><br><br><input type=submit value="Enter the Room"/></td></tr>
                        </form>
                        <%}%>
                    </table>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
        </table></body></html>
