<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,com.webchat.*, java.text.*"%>
<!DOCTYPE html>
<%
    String profileName = session.getAttribute("user").toString();
    String roomName = session.getAttribute("roomName").toString();
    HashMap<String, ChatRoom> roomList = (HashMap<String, ChatRoom>) application.getAttribute("roomList");
    ChatRoom room = roomList.get(roomName); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LetUsTalk.com</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <script>
            window.onload = function(){
                var chat = document.getElementById("chat");
                chat.scrollTop = chat.scrollHeight;
                setInterval("getChat()", 5000);
            }
            function getChat(){
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function(){
                        if (xmlhttp.readyState==4 && xmlhttp.status==200){
                        var chat = document.getElementById("chat");
                        chat.innerHTML = xmlhttp.responseText;
                        chat.scrollTop = chat.scrollHeight;
                    }
                }
                xmlhttp.open("get", "getchat.jsp", true)
                xmlhttp.send(null);
            }
        </script>
    </head>
    <body>
        <table width="900" height="550" border="0" align="center" cellpadding="10" bgcolor="#476BC0">
            <tr>
                <td align="top">
                    <h3>You are : <%= profileName%></h3>
                    <h3>Room Name : <%= roomName%></h3>
                    <div style="padding: 20px;overflow: scroll;height: 300px;background-color: yellow;color:blue;" id="chat">
                        <%
                            for (Iterator iterator = room.iterator(); iterator.hasNext();) {
                                ChatRoomEntry chatentry = (ChatRoomEntry) iterator.next();
                        %>
                        <p><%= chatentry.getProfileName()%> (<%= chatentry.getTime()%>) : <%= chatentry.getMessage()%></p>
                        <%
                            }
                        %>
                    </div
                </td>
            </tr>
            <tr>
                <td>
                    <form action="ChatEntryServlet" method="post">
                        <table align=center width=100%>
                            <tr><td><font color='#476BC0'>Your message</font></td></tr>
                            <tr><td><textarea name="message" cols=50 rows=3 class=smalltext></textarea></td></tr>
                            <tr><td><input type=submit value='Send' class=smalltext></td></tr>
                        </table>
                    </form>
                    <form action="ChatRoomServlet?action=exit" method="post">
                        <center><input type=submit value='Exit from Chat Room' onclick="return confirm('Are You Sure')" class=smalltext></center>
                    </form>
                    <br>
                    <p>
                        <a href="secure?action=logout">Logout</a>
                    </p>
                </td>
            </tr>
    </body>
</html>
