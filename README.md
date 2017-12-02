## Hello World Ethereum: Create an Ethereum smart contract and interact with it from a website

This tutorial aims at providing a simple starting point for developing Ethereum/Web applications, by showing how the main pieces (blockchain, contract, and Web server) can be put together on one's computer. We show how to install locally a simulated Ethereum blockchain, how to compile and push an Ethereum contract to that blockchain, and how to interact with it from a website and explore transaction contents.   

The contract used as an example is a 'simpleStorage' application, which allows to set and get a character string from an Ethereum contract. 

Three main tools need to be installed for running this tutorial: `truffle` and `ganache`for the Ethereum development part, and `http-request` for running a local web server. These tools are based on [node.js](https://nodejs.org/en).

With these tools, it is almost straightforward to create an Ethereum contract, send it on the blockchain, and interact with it from a website. 

Note: This tutorial assumes you are comfortable with using the Linux command line.

The main steps are:

1. Set up your environment
2. Start a local Ethereum client that simulates a blockchain
3. Compile and migrate the contract to the blockchain
4. Start a local HTTP server and interact with the contract from your Web browser. 

## Environment set up

The following tools are needed:

* `npm` : Node package manager, for using Node.js. [Node.js](https://en.wikipedia.org/wiki/Node.js) is an open-source, cross-platform JavaScript run-time environment for executing JavaScript code server-side. It is a widely used environment for developing Web server applications, and is needed to use Truffle tools, Ganache and the HTTP server. To install it, see [here](https://www.npmjs.com/get-npm).

	Check that

	```
	npm -v
	node -v
	```

	work properly.

	Versions used in this tutorial:

	* npm: 5.5.1
	* node: 6.9.1

* `truffle` : [Truffle](http://truffleframework.com) is a development framework that greatly managing (compiling, migrating and testing) Ethereum contracts. See [here](https://github.com/trufflesuite/truffle) for installation.

	Main step:
	
	`
	npm install -g truffle
	`
	
	Check version with:
	
	`
	npm -g list |grep truffle
	`
	
	Version used in this tutorial: trufle@4.0.1
 
* `ganache` : [Ganache](http://truffleframework.com/ganache/) is a personal blockchain for Ethereum development. It starts a local Ethereum client that simulates an Ethereum blockchain, and provides an interface to explore the blockchain content. Installation instructions are [here](https://github.com/trufflesuite/ganache). 

	Main steps:
	
	Choose a folder where to install `ganache`, for example in your home directory, git clone the ganache repository, and install with `npm`:
	
	```
	export GANACHE_DIR=$HOME
	cd $GANACHE_DIR
	git clone https://github.com/trufflesuite/ganache
	cd ganache
	npm install
	``` 
	
	Version used in this tutorial: 1.0.1 (you can check the version in the `package.json` file).

* `http-server` : [http-server](https://www.npmjs.com/package/http-server) is a basic `Node.js` server, that will be used to server the website. See [here](https://www.npmjs.com/package/http-server) for installation.

	Main step:
	
	`
	npm install -g http-server
	`
	
	Check version with:
	
	`
	npm -g list |grep http-server
	`
	
	Version used in this tutorial: http-server@0.10.0

* This tutorial repository (which is a [Truffle project](http://truffleframework.com/docs/getting_started/project)). Choose a folder where to install, for example in your home directory, git clone the repository, and install with `npm`:

	```
	export SIMPLE_STORAGE_DIR=$HOME
	cd $SIMPLE_STORAGE_DIR
	git clone https://gitlab.com/yannael/simpleStorage
	cd simpleStorage
	npm install
	``` 

## Start a local Ethereum client

Simply start ganache from a terminal:

```
cd $GANACHE_DIR
npm start
```

Ganache will start an Ethereum client listening by default on port 8545, create a set of 10 Ethereum accounts with 100 ether each (you are rich!), and open up a user interface where you can get account, bloks, transactions and logs information: 

![Ganache interface](images-readme/ganache.png "Ganache interface")

Ganache provides a simple simulation of the blockchain which is very convenient for development. All the transactions will be processed instantaneously, allowing to quickly interact with the blockchain. 


## Compile and migrate contract to the blockchain

Now go the simple storage application 

```
cd $SIMPLE_APP_DIR
```

The folder is a Truffle project. The basic components of a Truffle project are:

* `contracts` folder: Where contracts are stored. Look here to find `SimpleStorage.sol`, our contract that allows to set and get a status character string. Note: Ethereum contracts are written in [Solidity](https://solidity.readthedocs.io/en/develop/) (`.sol` extension).
* `migrations` folder: Where to define how to migrate contracts to the blockchain. Look here to find `2_deploy_contracts.js`, that defines the migration of the simple storage contract. 
* `truffle.js` file: Where to define the main configuration for the truffle project. In our case, it simply defines that the blockchain client is available on the local host at port 8545.

Now, let us compile the project:

```
truffle compile
```

This should return:

![Truffle compile](images-readme/truffle-compile.png)

A new folder was created, `build`, in which the contracts definitions and binaries are stored in `json` files.

To migrate the contracts to the bock chain, use

```
truffle migrate
```

This should return:

![Truffle compile](images-readme/truffle-migrations.png)

You can see the SimpleStorage contract address is `0x345ca3e014aaf5dca488057592ee47305d9b3e10`, which was created in transaction `0x5d6f659f249801922e8f44b970ddf0c1711588556c1d8b0e2fd0b09cdc5d87cc`.

Going to `ganache` user interface, in the 'Transactions' tab, you should see:

![Truffle compile](images-readme/ganache-tx.png)

The logs tab will give you logs of these tansactions and contract creations, and the accounts tab will show that some Ether were used on the first account (since deploying contracts cost Ether).  


## Interact with the contract from a website



## Going further:

* [A more advanced tutorial for building a pet shop Web application with Ethereum](http://truffleframework.com/tutorials/pet-shop). Also provides more insights into Truffle possibilities.
* [Truffle official documentation](http://truffleframework.com/docs/)
* [Ethereum documentation](http://www.ethdocs.org/en/latest/)
* [Web3 documentation](). Note: New version 1.0 upcoming, see there for the doc https://web3js.readthedocs.io/en/1.0/
* https://www.ethereum.org/token
* https://www.netguru.co/codestories/getting-started-with-ethereum-development
* Truffle+testnet https://blog.zeppelin.solutions/the-hitchhikers-guide-to-smart-contracts-in-ethereum-848f08001f05
