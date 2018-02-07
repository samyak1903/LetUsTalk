<%@page contentType="text/html" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
    String type = session.getAttribute("type").toString();
    if(!type.equals("Admin")){
        response.sendRedirect("error.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LetUsTalk.com</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <table width="900" height="550" border="0" align="center" cellpadding="10" bgcolor="#476BC0">
            <tr>
                <td width="200" rowspan="2" valign="top">
                    <%@ include file="menu.jsp"%> 	
                </td>
                <td height="328" bgcolor="#476BC0" valign="top">
                    <p>&nbsp;</p><p>&nbsp;</p> 
                    <div align="center">
                        <table align="center"><tr>
                                <td height="25" width="120" bgcolor="#993366">Add Users</td>
                                <td height="25" width="120" bgcolor="#728DCF"><a href="viewuser.jsp">View Users</a></td>
                                <td height="25" width="120" bgcolor="#728DCF"><a href="RoomServlet">Configure Rooms</a></td>
                                <td height="25" width="120" bgcolor="#728DCF"><a href="secure?action=logout">Logout</a></td></tr></table>
                        <br /><br />Enter New User Information.</div>
                    <form name="form" method="post" action="secure?action=addUser">
                        <table align="center">
                            <tr>
                                <td>Name</td><td><input type="text" size="25" name="name" class="smalltext"/></td>
                            </tr>
                            <tr>
                                <td>E Mail </td><td><input type="text" size="25" name="email" class="smalltext"/></td>
                            </tr>
                            <tr>
                                <td>Login id</td><td><input type="text" size="25" name="loginid" class="smalltext" /></td>
                            </tr>
                            <tr>
                                <td>Password</td><td><input type="password" size="25" name="password" class="smalltext" /></td>
                            </tr>
                            <tr>
                                <td>Type</td><td>
                                    <select name="type" class="smalltext">
                                        <option value="Admin">Admin</option>
                                        <option value="User">User</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="submit" name="submit" value="Submit" />
                                    <input type="reset" name="reset" value="Reset" />
                                </td></tr></table>
                    </form>
                </td>
            </tr>
            <tr>
                <td>
                    <%
                        if(request.getAttribute("status")==null){
                            
                        }else if(request.getAttribute("status").toString().equals("success")){
                            out.println("<h1>User added successfully</h1>");
                        }else {
                           out.println("<h1>Some error has occurred\nPlease try again</h1>"); 
                        }
                    %>
                </td>
            </tr>
        </table>
    </body>
</html>
