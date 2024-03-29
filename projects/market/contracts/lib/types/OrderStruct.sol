// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;
pragma abicoder v2;

library Order {
    using Order for Props;

    uint8 public constant STRUCT_VERSION = 0x01;

    struct Props {
        //====0
        bytes32 refCode;
        //====1
        uint128 collateral;
        uint128 size;
        //====2
        uint256 price;
        uint256 tp;
        //====3
        bool triggerAbove;
        bool isFromMarket;
        bool isKeepLev;
        bool isKeepLevTP;
        bool isKeepLevSL;
        uint64 orderID;
        uint64 pairId;
        uint64 fromId;
        uint32 updatedAtBlock;
        uint8 extra0;
        //====4
        address account; //224
        uint96 extra1;
        //====5
        uint256 sl;
        bool isIncrease;
        bool isLong;
        uint16 market;
        uint96 extra2; //todo
        uint128 gas;
        uint8 version;
    }

    function getKey(Props memory order) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(order.account, order.orderID));
    }

    function updateTime(Props memory _order) internal view {
        _order.updatedAtBlock = uint32(block.timestamp);
    }

    function isMarkPriceValid(Props memory _order, uint256 _oraclePrice) internal pure returns (bool) {
        // TODO
        return _order.isFromMarket || _order.price == _oraclePrice;
    }

    function validOrderAccountAndID(Props memory order) internal pure {
        require(order.account != address(0), "invalid order key");
        require(order.orderID != 0, "invalid order key");
    }

    function validTPSL(Props memory _order, bool _isLong) internal pure {
        if (_order.tp > 0) {
            require(_order.tp > _order.price == _isLong, "OrderBook:tp<price");
        }
        if (_order.sl > 0) {
            require(_order.price > _order.sl == _isLong, "OrderBook:sl>price");
        }
    }
    // 精度
    // 创建结构体
    // valid
    // 转换结构体
}
