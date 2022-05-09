//Smart Contract that stores messages and allows users to retrieve messages.
 pragma solidity ^0.4.24;

 contract MessageStore {

     string public message;
     address public owner;
     constructor(){
         owner = msg.sender;
     }


    function setMessage(string newMessage) public { 
        message = newMessage;
    }

    function getMessage() public view returns (string){
        return message;
    }

 }