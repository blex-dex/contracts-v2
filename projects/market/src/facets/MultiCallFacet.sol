// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiCallFacet {
    struct Result {
        bool success;
        bytes returnData;
    }

    function aggregateCall(bytes[] memory calls) public returns (uint256 blockNumber, bytes[] memory returnData) {
        blockNumber = block.number;
        returnData = new bytes[](calls.length);
        for (uint256 i = 0; i < calls.length; i++) {
            (address target, bytes memory callData) = abi.decode(calls[i], (address, bytes));
            (bool success, bytes memory ret) = target.call(callData);
            require(success, "BlexMulticall aggregate: call failed");
            returnData[i] = ret;
        }
    }

    function aggregateStaticCall(bytes[] memory calls)
        external
        view
        returns (uint256 blockNumber, bytes[] memory returnData)
    {
        blockNumber = block.number;
        returnData = new bytes[](calls.length);
        for (uint256 i = 0; i < calls.length; i++) {
            (address target, bytes memory callData) = abi.decode(calls[i], (address, bytes));
            (bool success, bytes memory ret) = target.staticcall(callData);
            require(success, "BlexMulticall aggregate: staticcall call failed");
            returnData[i] = ret;
        }
    }

    function blockAndAggregate(bytes[] memory calls)
        public
        returns (uint256 blockNumber, bytes32 blockHash, Result[] memory returnData)
    {
        (blockNumber, blockHash, returnData) = tryBlockAndAggregate(true, calls);
    }

    function getBlockHash(uint256 blockNumber) public view returns (bytes32 blockHash) {
        blockHash = blockhash(blockNumber);
    }

    function getBlockNumber() public view returns (uint256 blockNumber) {
        blockNumber = block.number;
    }

    function getCurrentBlockCoinbase() public view returns (address coinbase) {
        coinbase = block.coinbase;
    }

    function getCurrentBlockGasLimit() public view returns (uint256 gaslimit) {
        gaslimit = block.gaslimit;
    }

    function getCurrentBlockTimestamp() public view returns (uint256 timestamp) {
        timestamp = block.timestamp;
    }

    function getEthBalance(address addr) public view returns (uint256 balance) {
        balance = addr.balance;
    }

    function getLastBlockHash() public view returns (bytes32 blockHash) {
        blockHash = blockhash(block.number - 1);
    }

    function tryAggregate(bool requireSuccess, bytes[] memory calls) public returns (Result[] memory returnData) {
        returnData = new Result[](calls.length);
        for (uint256 i = 0; i < calls.length; i++) {
            (address target, bytes memory callData) = abi.decode(calls[i], (address, bytes));
            (bool success, bytes memory ret) = target.call(callData);

            if (requireSuccess) {
                require(success, "Multicall2 aggregate: call failed");
            }

            returnData[i] = Result(success, ret);
        }
    }

    function tryBlockAndAggregate(bool requireSuccess, bytes[] memory calls)
        public
        returns (uint256 blockNumber, bytes32 blockHash, Result[] memory returnData)
    {
        blockNumber = block.number;
        blockHash = blockhash(block.number);
        returnData = tryAggregate(requireSuccess, calls);
    }
}
