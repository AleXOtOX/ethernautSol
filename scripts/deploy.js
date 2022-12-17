// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const lockedAmount = hre.ethers.utils.parseEther("1");

  const ReentrantFactory = await hre.ethers.getContractFactory("reentrant");
  const Reentrant = await ReentrantFactory.deploy("0xC92d172D437A37c113B3c8a278bD723f708eD7b3");

  await Reentrant.deployed();
  console.log(Reentrant.address)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
