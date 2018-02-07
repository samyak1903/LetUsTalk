<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="com.webchat.*, java.util.*, java.text.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <%
        ArrayList<UserInfo> list = DBManager.getUsers();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>LetUsTalk.com/Admin Console/All User List</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <table width="900" height="550" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
            <tr>
                <td width="200" rowspan="2" valign="top">
                    <%@ include file="menu.jsp"%> 
                </td>
                <td height="550" bgcolor="#476BC0" valign="top">
                    <br><br>
                    <div align="center">
                        <table align="center"><tr>
                                <td height="25" width="120" bgcolor="#728DCF"><a href="adduser.jsp">Add Users</td>
                                <td height="25" width="120" bgcolor="#993366">View Users</td>
                                <td height="25" width="120" bgcolor="#728DCF"><a href="RoomServlet">Configure Rooms</a></td>
                                <td height="25" width="120" bgcolor="#728DCF"><a href="secure?option=logout">Logout</a></td></tr></table>
                        <br/><br/>User Information.</div><br />
                    <form name="form" method="get" action="secure">
                        <table align="center" width="100%">
                            <tr bgcolor="#36559E" align="center">
                                <td height="25"></td>
                                <td>Name</td>
                                <td>Login id</td>
                                <td>E-Mail</td>
                                <td>Type</td>
                            </tr>
                            <%
                                for(UserInfo user : list) {
                                    out.println("<tr>");
                                    out.println("<td><input type=\"checkbox\" value=\"" + user.getLoginId() + "\" name=\"loginid\"></td>");
                                    out.println("<td>" + user.getName() + "</td>");
                                    out.println("<td>" + user.getLoginId() + "</td>");
                                    out.println("<td>" + user.getEmail() + "</td>");
                                    out.println("<td>" + user.getType() + "</td>");
                                    out.println("</tr>");
                                }
                            %>
                            <tr>
                                <td colspan="5" align="center"><input type="submit" value="Delete User(s)" class="smalltext" /><br /><br />
                                    To Delete User(s) select them and click Delete User(s) Button.
                                </td>
                            </tr>
                        </table>
                            <input type="hidden" name="action" value="delete">
                    </form>
                </td></tr>
            <tr><td>&nbsp;</td></tr>
        </table></body></html>
