// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    Staking public staking;
    IERC20 public token;

    /// @dev Setup the testing environment.
    function setUp() public {
        token = IERC20(HuffDeployer.deploy("MockToken"));

        staking = Staking(
            HuffDeployer
                .config()
                .with_addr_constant("TOKEN_ADDRESS", address(token))
                .deploy("Staking")
        );
    }
}

interface Staking {
    function stake(uint256) external;

    function unstake(uint256) external;
}

interface IERC20 {
    function mint(address, uint) external;

    function transfer(address, uint) external;
}
