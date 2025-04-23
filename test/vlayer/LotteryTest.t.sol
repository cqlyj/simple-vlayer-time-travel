// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {console} from "forge-std/Test.sol";
import {VTest} from "vlayer-0.1.0/testing/VTest.sol";
import {PastBlockLottery} from "src/vlayer/PastBlockLottery.sol";
import {Proof} from "src/vlayer/BlockVerifier.sol";

contract LotteryTest is VTest {
    PastBlockLottery public lottery;
    address public user = makeAddr("user");

    function testProverWorks() public {
        lottery = new PastBlockLottery();

        vm.startPrank(user);
        lottery.enterLottery();

        vm.roll(10000);

        callProver(); // The next call will execute in the Prover
        lottery.pickWinner();
        // Proof memory proof = getProof();

        vm.stopPrank();
    }
}
