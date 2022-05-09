 //Added a modifier called isOwner which makes a required statement that must be passed in order for the function to work.
 pragma solidity ^0.4.24;

 contract MessageStore {

     string public message;
     address public owner;
     constructor() public{
         owner = msg.sender;
     }


    function setMessage(string newMessage) public isOwner{ 
        message = newMessage;
    }

    function getMessage() public view returns (string){
        return message;
    }

    modifier isOwner(){
         require(owner == msg.sender); //The function must be called by the owner.
         _; //This line at the end of the modifier is always used, this part is replaced by the function.
    }
 }