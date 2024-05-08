import { ethers,deployments,getNamedAccounts } from "hardhat";
import { BlexSBT } from "../typechain-types";
import { waitFor } from "../utils/wait";

async function mint(addressList: string[],uriList: string[]) {
  const { deployer } = await getNamedAccounts();
  console.log(deployer);
  const targetContract = await ethers.getContract<BlexSBT>("BlexSBT");
  await waitFor(targetContract.connect(await ethers.getSigner(deployer)).issueDegreeList(addressList,uriList));
  console.log("mint success");
}

async function main() {

  {
    // 交易先锋 nft1.blex.io/A-F/10-14.png
    const addressList = [
      "0x22b147A9e4E513d39775504EB7Db3D674D53d5dd"
    ]
    const uriList: string[] = []
    uriList.push(`https://nft1.blex.io/A/${10}.png`)
    await mint(addressList,uriList)
  }


  {
    // 交易大师 nft2.blex.io/A-F/01-09.png
    const addressList = [
      "0x22b147A9e4E513d39775504EB7Db3D674D53d5dd"
    ]
    const uriList: string[] = []
    uriList.push(`https://nft2.blex.io/A/${1}.png`)
    await mint(addressList,uriList)
  }


}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
