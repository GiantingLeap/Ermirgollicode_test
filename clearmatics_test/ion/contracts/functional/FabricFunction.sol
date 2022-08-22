pragma solidity ^0.5.12;
2
​
3
import "../storage/FabricStore.sol";
4
​
5
contract FabricFunction {
6
    FabricStore blockStore;
7
​
8
    constructor(address _storeAddr) public {
9
        blockStore = FabricStore(_storeAddr);
10
    }
11
​
12
    event State(uint blockNo, uint txNo, string mvalue);
13
​
14
    function execute(uint _blockNo, uint _txNo, string memory _value) internal {
15
        emit State(_blockNo, _txNo, _value);
16
    }
17
​
18
    function retrieveAndExecute(bytes32 _chainId, string memory _channelId, string memory _key) public {
19
        uint blockVersion;
20
        uint txVersion;
21
        string memory value;
22
​
23
        (blockVersion, txVersion, value) = blockStore.getState(_chainId, _channelId, _key);
24
​
25
        execute(blockVersion, txVersion, value);
26
    }
27
}
