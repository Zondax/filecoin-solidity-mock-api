---
title: "Solidity Mock API"
sidebar_position: 1
---

In the context of the Filecoin EVM, a Solidity library is required in order to allow Solidity smart contracts to seamlessly call methods on Filecoin built-in actors, as well as to access Filecoin specific syscalls idiomatically.

This project is the previous step of this bigger goal. It is a mocked version of that library which does not actually perform any cross-contract calls or syscalls. It will respond to specific scenarios, which are documented in this doc.
The ultimate goal is for devs to be able to replace imports of mocked library with the real one and have their contracts connected to the real protocol.

You can check the Solidity Mock API repo here [:link:](https://github.com/Zondax/fevm-solidity-mock-api)

We have also created an NPM package to facilitate its integration [:link:](https://www.npmjs.com/package/@zondax/filecoin-solidity-mock-api)

