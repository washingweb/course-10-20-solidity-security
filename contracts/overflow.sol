pragma solidity ^0.4.24;

import './SafeMath.sol';

// BEC
// 2018-04
contract Target {
    
    using SafeMath for uint;
    
    event Transfer(address, address, uint);
    
    mapping(address => uint) balances;
    
    function batchTransfer(address[] _receivers, uint256 _value)
        public returns (bool) {
        uint cnt = _receivers.length;
        uint256 amount = uint256(cnt) * _value;
        require(cnt > 0 && cnt <= 20);
        require(_value > 0 && balances[msg.sender] >= amount);
    
        balances[msg.sender] = balances[msg.sender].sub(amount);
        for (uint i = 0; i < cnt; i++) {
            balances[_receivers[i]] = balances[_receivers[i]].add(_value);
            Transfer(msg.sender, _receivers[i], _value);
        }
        return true;
    }
}
