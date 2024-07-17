// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract SmallSol {
    // Invariant: must never revert
    // Path 1: assert(a not 2**256 - 1); a = a+1; return a;
    // Path 2: assert(a := 2**256); revert;

    function f(uint256 a) public returns (uint256) {
        a = a + 1; // return a+1
        return a; // a + 1 (overflow revert)
    }
}
