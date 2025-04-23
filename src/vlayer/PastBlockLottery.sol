// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.28;

import {Proof} from "vlayer-0.1.0/Proof.sol";
import {Prover} from "vlayer-0.1.0/Prover.sol";

contract PastBlockLottery is Prover {
    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    address[] public s_players;
    address public s_winner;
    uint256 public immutable i_blockInterval;

    /*//////////////////////////////////////////////////////////////
                                 EVENTS
    //////////////////////////////////////////////////////////////*/

    event LotteryEntered(address indexed player);

    /*//////////////////////////////////////////////////////////////
                              CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor() {
        i_blockInterval = 10;
    }

    /*//////////////////////////////////////////////////////////////
                     EXTERNAL AND PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    function enterLottery() external {
        s_players.push(msg.sender);
        emit LotteryEntered(msg.sender);
    }

    function pickWinner() external returns (Proof memory, address) {
        // We first generate a random block number between current block and current block - i_blockInterval

        // uint256 blockNumber = block.number +
        //     (uint256(
        //         keccak256(abi.encodePacked(block.timestamp, block.prevrandao))
        //     ) % i_blockInterval) -
        //     i_blockInterval;

        uint256 blockNumber = 1000;

        // Then set this random block number as the block number to be used for the proof

        setBlock(blockNumber);

        // For simplicity, we just use the first player as the winner
        // You can design your own logic to pick a winner

        s_winner = s_players[0];

        s_players = new address[](0); // Reset the players array for the next lottery

        return (proof(), s_winner);
    }
}
