# Solidity Smart Contract: Understanding require(), assert(), and revert()

## Overview
This repository contains a simple Solidity smart contract that demonstrates the usage of require(), assert(), and revert() statements. These statements are essential for enforcing preconditions, and validating internal state, Require(), assert(), and revert() statements are used in a simple Solidity smart contract that is included in this repository. These are the fundamental statements that smart contract developers need to handle special instances, validate internal states, and enforce preconditions.and handling exceptional cases in smart contract development.

## Getting Started

### To interact with the smart contract, you'll need:
An Ethereum smart contract development environment (such as Remix, Truffle, or Hardhat). An Ethereum wallet or client (like MetaMask) for testnet or mainnet deployment and communication with the contract. 

### Executing program
You can use Remix, an online Solidity IDE to run this program. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., salinas.sol). Copy and paste the following code into the file:
 ```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Salinas {
    uint256 public balance;
    
    // Function to deposit Ether
    function deposit(uint256 amount) public {
        // Using require to check if the amount is greater than zero
        require(amount > 0, "Amount must be greater than zero");
        balance += amount;
    }
    
    // Function to withdraw Ether
    function withdraw(uint256 amount) public {
        // Using require to check if the amount is available in the balance
        require(amount <= balance, "Insufficient balance");
        assert(balance >= amount);
        balance -= amount;
        
        // Using revert with a custom error message
        if (balance < 100) {
            revert("Minimum balance requirement not met");
        }
    }
}
```

### Code Explanation
- require(): Used to enforce conditions that must be met for a function to execute successfully. It helps validate inputs and prevent invalid state changes.
- assert(): Checks for internal errors and invariant violations within the contract. It's crucial for ensuring the integrity of the contract's state.
- revert(): Reverts a transaction with a specified error message. It's useful for handling exceptional cases and aborting transactions when certain conditions aren't met.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
