// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script, console} from "forge-std/Script.sol";
import {PastBlockLottery} from "src/vlayer/PastBlockLottery.sol";

contract DeployPastBlockLottery is Script {
    function run() external {
        vm.startBroadcast();
        PastBlockLottery pastBlockLottery = new PastBlockLottery();
        console.log(
            "PastBlockLottery deployed to: ",
            address(pastBlockLottery)
        );
        vm.stopBroadcast();
    }
}
