// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.28;

import {Proof} from "vlayer-0.1.0/Proof.sol";
import {Verifier} from "vlayer-0.1.0/Verifier.sol";
import {RewardNft} from "./RewardNft.sol";
import {PastBlockLottery} from "./PastBlockLottery.sol";

contract BlockVerifier is Verifier {
    address public i_prover;
    RewardNft public immutable i_rewardNft;

    constructor(address prover, address rewardNft) {
        i_prover = prover;
        i_rewardNft = RewardNft(rewardNft);
    }

    function claim(
        Proof calldata,
        address claimer
    ) public onlyVerified(i_prover, PastBlockLottery.pickWinner.selector) {
        if (claimer != address(0)) {
            i_rewardNft.mint(claimer);
        }
    }
}
