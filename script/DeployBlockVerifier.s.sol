// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script, console} from "forge-std/Script.sol";
import {BlockVerifier} from "src/vlayer/BlockVerifier.sol";
import {Vm} from "lib/forge-std/src/Vm.sol";

contract DeployBlockVerifier is Script {
    function run() external {
        address prover = Vm(address(vm)).getDeployment(
            "PastBlockLottery",
            uint64(block.chainid)
        );

        address rewardNft = Vm(address(vm)).getDeployment(
            "RewardNft",
            uint64(block.chainid)
        );

        vm.startBroadcast();
        BlockVerifier blockVerifier = new BlockVerifier(prover, rewardNft);
        console.log("BlockVerifier deployed to: ", address(blockVerifier));
        vm.stopBroadcast();
    }
}
