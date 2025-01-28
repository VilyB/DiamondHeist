#!/bin/bash

export RPC_URL=http://164.90.231.253:8545/woZCjUUbWwkwGIQXPKSwOjwa/main
export PLAYER_PRIVATE_KEY=0x5eaa08d61a3a49b7787c079586dc1e755d13a98e151f70d9dbbef783f848d890
export CHALLENGE_CONTRACT_ADDRESS=0x0ABB2a582d8e8AEce251eE6195B26981B3DD2022

# Run the Upgrade and Self-Destruct script
# === Run the DeployExploit Script ===
forge script script/DeployExploit.s.sol:DeployExploit \
    --rpc-url "$RPC_URL" \
    --private-key "$PLAYER_PRIVATE_KEY" \
    --broadcast \
    -vvv > DeployExploits.log
echo "Upgrade and SelfDestruct completed."

# === Optional: Wait for a Few Seconds to Ensure State Propagation ===
sleep 5

# === Run the RecreateVault Script ===
forge script script/RecreateVault.s.sol:RecreateVault \
    --rpc-url "$RPC_URL" \
    --private-key "$PLAYER_PRIVATE_KEY" \
    --broadcast \
    -vvv > RecreateVault.log
echo "Recreate Vault completed."



