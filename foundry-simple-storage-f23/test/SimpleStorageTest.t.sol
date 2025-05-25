//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        DeploySimpleStorage deployer = new DeploySimpleStorage();
        simpleStorage = deployer.run();
    }

    function testStoreNumber() public {
        uint256 expectedFavoriteNumber = 100;
        simpleStorage.store(expectedFavoriteNumber);
        assertEq(simpleStorage.retrieve(), expectedFavoriteNumber);
    }

    function testCreatePerson() public {
        string memory name = "John";
        uint256 expectedNumber = 100;

        simpleStorage.addPerson(name, expectedNumber);
        uint256 retrievedNumber = simpleStorage.nameToFavoriteNumber(name);
        assertEq(retrievedNumber, expectedNumber);
    }
}
