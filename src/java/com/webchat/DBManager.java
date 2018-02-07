package com.webchat;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class DBManager {

    private static final String DBDriver = "com.mysql.jdbc.Driver";
    private static final String DBUrl = "jdbc:mysql://localhost:3306/webchat";
    private static final String DBUser = "root";
    private static final String DBPassword = "root";

    static {
        try {
            Class.forName(DBDriver);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static int addUser(String loginid, String password, String type, String name, String email) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Insert into login  Values(?,?,?,?,?)");
            st.setString(1, loginid);
            st.setString(2, password);
            st.setString(3, type);
            st.setString(4, name);
            st.setString(5, email);
            x = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return x;
    }
    public static int addRoom(String roomName, String roomDesc) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Insert into chatrooms  Values(?,?)");
            st.setString(1, roomName);
            st.setString(2, roomDesc);
            x = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return x;
    } 
    public static int deleteRoom(String roomName) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("delete from chatrooms where RoomName = ?");
            st.setString(1, roomName);
            x = st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return x;
    }    
    public static boolean isUserIdAvailable(String userId) {
        boolean flag=true;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Select * from users where UserId=?");

            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                flag=false;
            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
		System.out.println(ex);
        }
        return flag;
    }
    public static boolean deleteUser(String loginId) {
        boolean flag=true;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Delete from login where LoginId=?");
            st.setString(1, loginId);
            st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception ex) {
		System.out.println(ex);
        }
        return flag;
    }    
    public static String authenticateUser(String loginId, String passwd, String type) {
        String name = null;
        try {
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Select * from login where loginid=? and Password=? and Type=?");
            st.setString(1, loginId);
            st.setString(2, passwd);
            st.setString(3, type);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                name = rs.getString("name");
            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return name;
    }
    public static ArrayList<UserInfo> getUsers(){
        ArrayList<UserInfo> list = new ArrayList<UserInfo>();
        try{
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Select * from login");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                String loginid = rs.getString(1);
                String type = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                UserInfo user = new UserInfo(loginid, name, email, type);
                list.add(user);
            }
        }catch(Exception ex){
            System.out.println(ex);
        }
        return list;
    }    
    public static HashMap<String,ChatRoom> getRooms(){
        HashMap<String,ChatRoom> map = new HashMap<String,ChatRoom>();
        try{
            Connection con = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
            PreparedStatement st = con.prepareStatement("Select * from chatrooms");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                String roomName = rs.getString(1);
                String roomDesc = rs.getString(2);
                ChatRoom room = new ChatRoom(roomName,roomDesc);
                map.put(roomName, room);
            }
        }catch(Exception ex){
            System.out.println(ex);
        }
        return map;
    }
}
