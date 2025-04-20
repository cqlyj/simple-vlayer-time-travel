// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script, console} from "forge-std/Script.sol";
import {RewardNft} from "src/vlayer/RewardNft.sol";

contract DeployRewardNft is Script {
    function run() external {
        vm.startBroadcast();
        RewardNft rewardNft = new RewardNft();
        console.log("RewardNft deployed to: ", address(rewardNft));
        vm.stopBroadcast();
    }
}
