 //Added 2 new functions:1. getBalance() 2. getBalanceInEth(), both of which are used to get the balance of the account in ETH or in wei;
 pragma solidity ^0.4.24;

 contract MessageStore {

     string public message;
     address public owner;
     constructor() public{
         owner = msg.sender;
     }


    function setMessage(string newMessage) public payable { 
        require(msg.value == 3 ether);
        message = newMessage;
    }

    function getMessage() public view returns (string){
        return message;
    }

    modifier isOwner(){
         require(owner == msg.sender);
         _;
    }

    function getBalance() public view returns(uint) { //getBalance() is used to get the balance of the account in wei;
        return address(this).balance;
    }
    function getBalanceInEther() public view returns(uint) {  //getBalanceInEth() is used to get the balance of the account in ETH;
        return getBalance() / 1e18;
    }

 }