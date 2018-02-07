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
            String type = (String) request.getParameter("type");
        %>
        <table width="900" height="550" border="0" align="center" cellpadding="10" bgcolor="#476BC0">
            <tr>
                <td width="200" rowspan="2" valign="top">
                    <%@ include file="menu.jsp"%> 	
                </td>
                <td height="550" bgcolor="#476BC0" valign="top">
                    <p>&nbsp;</p>
                    <p>&nbsp;</p> <p>&nbsp;</p>
                    <div align="center"><font size="+2">Welcome!</font></div>
                    <br /><br />
                    <div align="left">
                        <%
                            SimpleDateFormat df = new SimpleDateFormat("EEEE, dd MMMM, yyyy");
                            String date = df.format(new Date());
                            out.println(date + "&nbsp;&nbsp;<br><br>");
                        %>
                    </div>
                    <form method="post" action="secure?action=login">
                        <p>&nbsp;</p>	
                        <p align="center">Enter Login id and password.</p>
                        <table align="center" cellpadding="10" bgcolor="#728DCF">
                            <tr><td>Login id : </td>
                                <td><input name=loginid size=20 class="smalltext"></td>
                            </tr>
                            <tr><td >Password : </td>
                                <td><input name=password type="password" size=20 class="smalltext"></td>
                            </tr>
                            <tr><td >Type : </td>
                                <td><%=type%><input type="hidden" name="type" value="<%=type%>"</td>
                            </tr>
                            <tr><td colspan="2" align="center"><input type="submit" value="Login"/></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </body>
</html>
