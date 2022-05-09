 //Using inheritance to divide code.
 pragma solidity ^0.4.24;

import "./Herencia2.sol"; //Importing the contract Herencia2.sol

 contract Herencia is Herencia2{ //Add inheritance to the contract Herencia.
     string public message;


    function setMessage(string newMessage) public payable { 
        require(msg.value == 3 ether);
        message = newMessage;
    }

    function getMessage() public view returns (string){
        return message;
    }

 }