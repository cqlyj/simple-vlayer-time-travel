// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Proof} from "vlayer-0.1.0/Proof.sol";
import {Prover} from "vlayer-0.1.0/Prover.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

contract PastBlockProver is Prover, Ownable {
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

    constructor() Ownable(msg.sender) {
        i_blockInterval = 1000;
    }

    /*//////////////////////////////////////////////////////////////
                     EXTERNAL AND PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    function enterLottery() external {
        s_players.push(msg.sender);
        emit LotteryEntered(msg.sender);
    }

    function pickWinner() external onlyOwner returns (Proof memory, address) {
        // We first generate a random block number between current block and current block - i_blockInterval
        uint256 blockNumber = block.number -
            (block.number % i_blockInterval) +
            (uint256(
                keccak256(abi.encodePacked(block.timestamp, block.prevrandao))
            ) % i_blockInterval);

        // Then set this random block number as the block number to be used for the proof
        setBlock(blockNumber);
        for (uint256 i = 0; i < s_players.length; i++) {
            // The winner is the player at the block number which holds the maximum balance
            if (s_players[i].balance > s_winner.balance) {
                s_winner = s_players[i];
            }
        }

        s_players = new address[](0); // Reset the players array for the next lottery

        return (proof(), s_winner);
    }
}
