package com.webchat;

import java.util.Stack;

public class ChatRoom extends Stack {
    private String roomName;
    private String roomDesc;

    public ChatRoom() {
    }

    public ChatRoom(String roomName, String roomDesc) {
        this.roomName = roomName;
        this.roomDesc = roomDesc;
    }
    
    public void joinChatEntry(ChatRoomEntry  entry){
	    push(entry);
    }

    public String getRoomDesc() {
        return roomDesc;
    }

    public void setRoomDesc(String roomDesc) {
        this.roomDesc = roomDesc;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
}
