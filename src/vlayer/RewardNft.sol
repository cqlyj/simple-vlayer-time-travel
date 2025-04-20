// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";

contract RewardNft is ERC721 {
    uint256 public tokenId;

    constructor() ERC721("RewardNft", "RNFT") {}

    function mint(address to) external {
        _mint(to, tokenId);
        tokenId++;
    }
}
