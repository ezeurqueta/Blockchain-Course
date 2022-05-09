 //Added the payable method which tells the compiler that the function must be called with ether.
 pragma solidity ^0.4.24;

 contract MessageStore {

     string public message;
     address public owner;
     constructor() public{
         owner = msg.sender;
     }


    function setMessage(string newMessage) public payable {  
        require(msg.value == 3 ether); //The function must be called with 3 ether.
        message = newMessage;
    }

    function getMessage() public view returns (string){ //The function is only viewable.
        return message; 
    }

    modifier isOwner(){
         require(owner == msg.sender); 
         _;
    }
 }