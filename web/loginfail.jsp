<%@page contentType="text/html" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
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
                    <br><br><br>
                    <div align="center">
                        <p>Either Your Login Id or the Password is wrong.<br />
                            Try with a valid Login Id and Password.</p>
                        <p>Please, check the type of your login i.e. Admin or User. </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </body>
</html>
