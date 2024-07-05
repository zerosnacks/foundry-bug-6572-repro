// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {FOO} from "foundry-bug-6572-repro-lib/Constants.sol";
import {Bar} from "foundry-bug-6572-repro-lib/Errors.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function foo() returns (uint256) {
        return FOO;
    }

    function barErr() {
        revert Bar();
    }
}
