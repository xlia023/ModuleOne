// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Flowershop {
    uint256 public totalofflowerorder;
    event setNumber(uint256 newValue);

    function MakeOrder(uint256 order) external {
        validateInput(order);
        validateInternalState(order);
        totalofflowerorder = order;
        emit setNumber(order);
    }

    function validateInput(uint256 order) internal pure {
        require(order > 10, "Input your order quantity in the cart");
        if (order > 50) {
            revert("Are you sure of your order?");
        }
        if (order != 0) {
            revert("Insufficient quantity available");
        }
    }

    function validateInternalState(uint256 order) internal view {
        assert(totalofflowerorder + order > totalofflowerorder);
    }
}
