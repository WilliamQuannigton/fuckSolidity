// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BeggingContract is Ownable {

    mapping(address => uint256) public donationsAmount;
    address[] public donors;

    event DonationReceived(address indexed donor, uint256 amount);
    event Withdrawal(address indexed receiver, uint amount);

    error BeggingContract__InsufficientBalance();
    error BeggingContract__InvalidTimeWindow();

    modifier onlyDuringTimeWindow() {
        uint256 hour = (block.timestamp / 60 / 60) % 24;
        if (hour < 8 || hour >= 12) {
            revert BeggingContract__InvalidTimeWindow();
        }
        _;
    }


    constructor() Ownable(msg.sender) {}

    function donate() external payable onlyDuringTimeWindow {
        require(msg.value > 0, "Donation amount must be greater than 0");
        if(donationsAmount[msg.sender] == 0) {
            donors.push(msg.sender);
        }
        donationsAmount[msg.sender] += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyOwner {
        if(address(this).balance < amount) {
            revert BeggingContract__InsufficientBalance();
        }
        payable(owner()).transfer(amount);
        emit Withdrawal(owner(), amount);
    }

    function getDonationsAmount(address donor) external view returns(uint256) {
        return donationsAmount[donor];
    }

    function getMost3DonationsDonors() external view returns(address[3] memory) {
        address[3] memory most3Donors;
        uint256[3] memory topAmounts;

        for (uint256 i = 0; i < donors.length; i++) {
            address donor = donors[i];
            uint256 amount = donationsAmount[donor];

            for (uint256 j = 0; j < 3; j++) {
                if (amount > topAmounts[j]) {
                    for (uint256 k = 2; k > j; k--) {
                        topAmounts[k] = topAmounts[k-1];
                        most3Donors[k] = most3Donors[k-1];
                    }
                    topAmounts[j] = amount;
                    most3Donors[j] = donor;
                    break;
                }
            }
        }
        return most3Donors;
    }
    
}

// Contract address: 0xb38d5076b58432393D3832B978cF3082AA59f5aC
// ether scan: https://sepolia.etherscan.io/address/0xb38d5076b58432393d3832b978cf3082aa59f5ac