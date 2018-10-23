pragma solidity ^0.4.25;

contract Target {
    
    uint constant TARGET = 10 ether;
    
    function deposit() public payable {
        uint balance = address(this).balance + msg.value;
        require(balance <= TARGET);
    }
    
    function withdraw() public {
        uint balance = address(this).balance;
        if (balance == TARGET) {
            msg.sender.transfer(balance);
        }
    }
}
