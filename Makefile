-include .env

deploy-reward-nft:
	@forge script script/DeployRewardNft.s.sol:DeployRewardNft --rpc-url $(OP_SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast --verify --verifier blockscout --verifier-url https://optimism-sepolia.blockscout.com/api/ -vvvv

deploy-past-block-lottery:
	@forge script script/DeployPastBlockLottery.s.sol:DeployPastBlockLottery --rpc-url $(OP_SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast --verify --verifier blockscout --verifier-url https://optimism-sepolia.blockscout.com/api/ -vvvv

deploy-block-verifier:
	@forge script script/DeployBlockVerifier.s.sol:DeployBlockVerifier --rpc-url $(OP_SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast --verify --verifier blockscout --verifier-url https://optimism-sepolia.blockscout.com/api/ -vvvv