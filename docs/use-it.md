---
title: How to use it on my project?
sidebar_position: 4
---

In order to use these APIs in your project, you will need to deploy them first. As they are contracts themselves, they need to be present on the chain first. Then, using the address you get from deploying them,
you can reference them on your project. 

## Steps

### Deploy API

In order to deploy these libraries, please refer to [this section](./deploy-it.md). You will find useful information about it. 

### Import API contract on your project 

```solidity
import { MarketAPI } from "../MarketAPI.sol";
import { CommonTypes } from "../types/CommonTypes.sol";
import { MarketTypes } from "../types/MarketTypes.sol";
```

### Create an callable instance 
```solidity
MarketAPI marketApiInstance = MarketAPI(marketApiAddress);
```

### Do a call to a particular method

```solidity
bytes memory addr = bytes("0x1111");
MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, 1);

MarketTypes.WithdrawBalanceReturn memory response = marketApiInstance.withdraw_balance(params);
```

## Working examples
In order to see a complete demo you can use as example, please refer to [this folder](../contracts/v0.8/testContracts). You will find some smart contracts as examples
