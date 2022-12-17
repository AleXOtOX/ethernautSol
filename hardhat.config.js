require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({path:".env"});

const Wallet = process.env.WALLET
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    mumbaiPolygon: {
      url: "https://matic-mumbai.chainstacklabs.com",
      chainId: 80001,
      gas: 20000000,
      gasPrice: 8000000000,
      accounts: [Wallet]
    }
  },
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      }
    }
  }
};
