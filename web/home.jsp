<%@page contentType="text/html" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LetUsTalk.com</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            String user = session.getAttribute("user").toString();
            String type = session.getAttribute("type").toString();
        %>
        <table width="900" height="550" border="0" align="center" cellpadding="10" bgcolor="#476BC0">
            <tr>
                <td width="200" rowspan="2" valign="top">
                    <%@ include file="menu.jsp"%> 	
                </td>
                <td height="328" bgcolor="#476BC0" valign="top">
                    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                    <div align="center"><font size="+2">Welcome, <%=user%></font></div>
                    <p>&nbsp;</p><p>&nbsp;</p>
                    <table align="center" width="200" cellpadding="5" cellspacing="3"> 
                        <%
                            if ("Admin".equals(type)) {
                        %>
                        <tr><td height="30" bgcolor="#728DCF"><a href="adduser.jsp">Add Users</a></td></tr>
                        <tr><td height="30" bgcolor="#728DCF"><a href="viewuser.jsp">View Users</a></td></tr>
                        <tr><td height="30" bgcolor="#728DCF"><a href="RoomServlet">Configure Rooms</a></td></tr>
                        <tr><td height="30" bgcolor="#728DCF"><a href="secure?action=logout">Logoff</a></td></tr>
                        <%                
                            }else {
                        %>
                        <tr><td height="30" bgcolor="#728DCF"><a href="roomlist.jsp">Select Chat Rooms</a></td></tr>
                        <tr><td height="30" bgcolor="#728DCF"><a href="secure?action=logout">Logout</a></td></tr>
                        <%}%>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </body>
</html>
