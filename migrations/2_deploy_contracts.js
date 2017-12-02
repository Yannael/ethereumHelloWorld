var SimpleStorage = artifacts.require("./SimpleStorage.sol");

module.exports = function(deployer) {
	// Arguments after contract name are passed to the constructor
  deployer.deploy(SimpleStorage,"Hello");
};
