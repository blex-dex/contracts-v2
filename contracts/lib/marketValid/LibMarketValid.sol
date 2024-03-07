// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library LibMarketValid { /* is IOrderBook, Ac */
    bytes32 constant MV_STORAGE_POSITION = keccak256("blex.marketvalid.storage");
    uint256 private constant DECIMALS = 10000;

    struct Props {
        bool allowClose;
        bool allowOpen;
        bool validDecrease;
        uint16 minSlippage;
        uint16 maxSlippage;
        uint16 minLeverage;
        uint16 maxLeverage;
        uint16 minPayment;
        uint16 minCollateral;
        uint16 decreaseNumLimit;
        uint32 maxTradeAmount;
    }

    struct MarketValidStorage {
        mapping(uint16 => Props) config;
    }

    function Storage() internal pure returns (MarketValidStorage storage fs) {
        bytes32 position = MV_STORAGE_POSITION;
        assembly {
            fs.slot := position
        }
    }

    function setConfData(uint16 market, Props calldata data) external {
        Storage().config[market] = data;
    }

    function config(uint16 market) internal view returns (Props memory _config) {
        _config = Storage().config[market];
        // TODO: return default value
    }

    function validPosition(bytes calldata data) external view {
        uint16 market;
        bool isIncrease;
        if (isIncrease) {
            validPay(market, 0);
        }
        uint256 _sizeDelta = 0;
        if (_sizeDelta > 0) {} else {
            validCollateralDelta(data);
        }
        // MarketDataTypes.UpdatePositionInputs memory params,
        // Position.Props memory position,
        // int256[] memory fees
    }

    function validIncreaseOrder(bytes calldata data) external view {
        uint16 market;
        validPay(market, 0);
        // MarketDataTypes.UpdateOrderInputs memory vars,
        // int256 fees
    }

    function validDecreaseOrder(bytes calldata data) external view {
        // uint16 market,
        // uint256 collateral,
        // uint256 collateralDelta,
        // uint256 size,
        // uint256 sizeDelta,
        // int256 fees,
        // uint256 decrOrderCount
    }

    function validLev(uint16 market, uint256 newSize, uint256 newCollateral) external view {}
    function validTPSL(uint16 market, uint256 triggerPrice, uint256 tpPrice, uint256 slPrice, bool isLong)
        internal
        pure
    {}

    function getDecreaseOrderValidation(uint16 market, uint256 decrOrderCount) external view returns (bool isValid) {}

    function validateLiquidation(
        uint16 market,
        int256 pnl,
        int256 fees,
        int256 liquidateFee,
        int256 collateral,
        uint256 size,
        bool raise
    ) external view returns (uint8) {}
    //================================================================================================
    // internal
    //================================================================================================
    function validSize(uint16 market, uint256 size, uint256 sizeDelta, bool isIncrease) internal pure {}
    function validMarkPrice(uint16 market, bool isLong, uint256 price, bool isIncrease, bool isExec, uint256 markPrice)
        internal
        pure
    {}

    function validSlippagePrice(bytes calldata data) internal view {
        // MarketDataTypes.UpdatePositionInputs memory inputs // uint256 price, // （usdt） // bool isLong, // uint256 slippage, // bool isIncrease, // bool isExec, // uint256 markPrice
    }
    function validCollateralDelta(bytes calldata data) internal view {
        // uint16 market,
        // uint256 busType, // 1:increase 2. increase coll 3. decrease 4. decrease coll
        // uint256 collateral,
        // uint256 collateralDelta,
        // uint256 size,
        // uint256 sizeDelta,
        // int256 fees
    }
    function validPay(uint16 market, uint256 pay) internal view {}
}
