// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/AlgorithmSolutions.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        AlgorithmSolutions algorithmSolutions = new AlgorithmSolutions();

        vm.stopBroadcast();
    }
} 