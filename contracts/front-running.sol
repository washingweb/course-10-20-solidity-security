pragma solidity ^0.4.25;

contract Target {
    bytes32 constant public hash = 0x3376481fd;
    
    constructor() public payable {}
    
    function solve(string solution) public {
        require(hash == keccak256(solution));
        msg.sender.transfer(1000 ether);
    }
}
    