# Learning Foundry

Welcome to my Foundry learning repository! This repository contains my journey of learning Foundry, a fast and modular framework for Ethereum development. Previously, I have worked with Truffle and Hardhat, and now I am exploring the capabilities of Foundry. This learning path follows Patrick's course on Foundry.

## Table of Contents

- [Learning Foundry](#learning-foundry)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Setup and Installation](#setup-and-installation)
  - [Projects](#projects)
    - [Basic Contract Deployment](#basic-contract-deployment)
    - [Unit Testing](#unit-testing)
    - [Advanced Features](#advanced-features)
  - [Resources](#resources)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

Foundry is a blazing fast, portable, and modular toolkit for Ethereum application development written in Rust. It includes features like fast compilation, built-in testing, and easy scripting. This repository documents my progress and understanding as I transition from using Truffle and Hardhat to mastering Foundry.

## Setup and Installation

To get started with Foundry, you need to install it. Follow these steps:

1. **Install Foundry**:
    ```sh
    curl -L https://foundry.paradigm.xyz | bash
    foundryup
    ```

2. **Verify Installation**:
    ```sh
    forge --version
    ```

3. **Create a New Project**:
    ```sh
    forge init my-foundry-project
    cd my-foundry-project
    ```

## Projects

### Basic Contract Deployment

The first step in learning Foundry is deploying a simple smart contract. This involves writing a Solidity contract and deploying it using Foundry.

- **SimpleStorage.sol**:
    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    contract SimpleStorage {
        uint256 private data;

        function setData(uint256 _data) public {
            data = _data;
        }

        function getData() public view returns (uint256) {
            return data;
        }
    }
    ```

- **Deployment Script**:
    ```sh
    forge create --rpc-url YOUR_RPC_URL --private-key YOUR_PRIVATE_KEY src/SimpleStorage.sol:SimpleStorage
    ```

### Unit Testing

Unit testing is crucial for ensuring the correctness of smart contracts. Foundry provides robust testing capabilities.

- **SimpleStorage.t.sol**:
    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    import "forge-std/Test.sol";
    import "../src/SimpleStorage.sol";

    contract SimpleStorageTest is Test {
        SimpleStorage private storageContract;

        function setUp() public {
            storageContract = new SimpleStorage();
        }

        function testSetData() public {
            storageContract.setData(42);
            assertEq(storageContract.getData(), 42);
        }
    }
    ```

- **Run Tests**:
    ```sh
    forge test
    ```

### Advanced Features

As I progress, I explore advanced features such as fuzz testing, property-based testing, and integrating with other tools and libraries.

- **Fuzz Testing**:
    ```solidity
    // Additional test cases using fuzzing
    function testFuzzSetData(uint256 _data) public {
        storageContract.setData(_data);
        assertEq(storageContract.getData(), _data);
    }
    ```

- **Integration with Hardhat**:
    Integrating Foundry with existing Hardhat projects for enhanced testing capabilities.

## Resources

- [Foundry Documentation](https://book.getfoundry.sh/)
- [Patrick's Foundry Course](https://www.youtube.com/playlist?list=PLzj7TwUeMQ3i2UYfgViYdT9LpJnT6-WK7)
- [Ethereum Development with Foundry](https://github.com/foundry-rs/foundry)

## Contributing

Contributions are welcome! If you have improvements or additional features to add, please submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
