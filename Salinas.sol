    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    contract Salinas {
        struct Flower {
            string name;
            uint256 quantity;
        }

        mapping(string => Flower) public Flowers;
        uint256 public TotalofFlowerOrder;
        event setNumber(uint256 newValue);
        event FlowerRestocked(string flowerName, uint256 quantity);


        function MakeOrder(uint256 order) external {
            validateInput(order);
            validateInternalState(order);
            TotalofFlowerOrder = order;
            emit setNumber(order);
        }

        function validateInput(uint256 order) internal pure {
            require(order != 0, "Input your order quantity in the cart");
            if (order > 50) {
                revert("Are you sure of your order?");
            }
        }

        function RestockFlowers(string memory name, uint256 quantity) public {
            require(bytes(name).length > 0, "Flower name cannot be empty");
            require(quantity > 0, "Quantity must be greater than zero");
            
            Flower storage flower = Flowers[name];
            flower.quantity += quantity;
            
            emit FlowerRestocked(name, quantity);
        }

        function validateInternalState(uint256 order) internal view {
            assert(TotalofFlowerOrder + order > TotalofFlowerOrder);
        }
    }
