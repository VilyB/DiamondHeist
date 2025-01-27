#!/bin/bash

export RPC_URL=http://164.90.231.253:8545/OdLZznHExFlAvCDXPnTbhacH/main
export PRIVATE_KEY=0x581d56820c8d030ab310949293e8c6fd253da6661c6016a3aebf9b317b266076
export CHALLENGE_CONTRACT_ADDRESS=0x3a6eB96227102408632dB91988F64c08cCdFb687

# Run the Upgrade and Self-Destruct script
forge script script/DeployExploit.s.sol:DeployExploit --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast -vvv > DeployExploits.log
echo "Upgrade and SelfDestruct completed."

# Optional: Wait for a few seconds to ensure state propagation
sleep 20

# Run the Recreate Vault script
forge script script/RecreateVault.s.sol:RecreateVault --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast -vvv > RecreateVault.log
echo "Recreate Vault completed."