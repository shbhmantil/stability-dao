// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import "../../src/adapters/AlgebraAdapter.sol";
import "../../src/adapters/UniswapV3Adapter.sol";
import "../../src/adapters/KyberAdapter.sol";
import "../../src/core/Zap.sol";

contract PrepareUpgrade2 is Script {
    function run() external {
        uint deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        new AlgebraAdapter();
        new UniswapV3Adapter();
        new KyberAdapter();
        new Zap();
        vm.stopBroadcast();
    }

    function testPrepareUpgrade() external {}
}
