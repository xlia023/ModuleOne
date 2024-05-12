// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Salinas {
    uint256 public balance;
    
    // Function to deposit Ether
    function deposit(uint256 amount) public {
        // Using require to check if amount is greater than zero
        require(amount > 0, "Amount must be greater than zero");
        balance += amount;
    }
    
    // Function to withdraw Ether
    function withdraw(uint256 amount) public {
        // Using require to check if amount is available in the balance
        require(amount <= balance, "Insufficient balance");
        assert(balance >= amount);
        balance -= amount;
        
        // Using revert with a custom error message
        if (balance < 100) {
            revert("Minimum balance requirement not met");
        }
    }
}