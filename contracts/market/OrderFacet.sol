// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import {MarketDataTypes} from "../lib/MarketDataTypes.sol";
import {Order} from "../lib/order/Order.sol";

contract OrderFacet { /* is IAccessManaged */
    function updateOrder(bytes calldata data) external {
        Order.Props memory _order;
        // (_order) =
        //     abi.decode(data, (uint256, bool, uint256));
        if (_inputs.isCreate) {
            // createOrder
        } else {
            // updateOrder
        }
    }

    function cancelOrderList(bytes calldata data) external {
        if (msg.sender == address(this)) {} else {
            // user cancel
        }
    }

    function sysCancelOrder(bytes calldata data) external {
        if (msg.sender == address(this)) {} else {
            // restricted();
        }
    }
}
