 //Made it so that ypu can transfer the amount back to the owner of the contract.
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
    function transfer(uint amount) public isOwner { //transfer() is used to transfer the amount back to the owner of the contract.
        require(address(this).balance >= amount); //require() is used to check if the amount is enough.
        owner.transfer(amount); 
    }

 }