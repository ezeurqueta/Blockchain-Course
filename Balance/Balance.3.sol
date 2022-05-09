 //Added a function that lets the owner of the contract transfer the amount to another account.
 pragma solidity ^0.4.24;

 contract MessageStore {

     string public message;
     address internal owner;  //Internal means like protected. It can be refered by the ones that inherits it too.
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

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function getBalanceInEther() public view returns(uint) {
        return getBalance() / 1e18;
    }
    function transfer(uint amount) public isOwner {
        require(address(this).balance >= amount);
        owner.transfer(amount);
    }

    function transferTo(uint amount, address receiver) public isOwner { //transferTo() is used to transfer the amount to another account.
        require(address(this).balance >= amount); //require() is used to check if the amount is enough.
        require(receiver != address(0)); //require() is used to check if the receiver is not an empty account.
        receiver.transfer(amount);  
    }

 }