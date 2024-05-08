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
      "0x60d4d93f5aedde143ab93c5223c3c62afcae0859","0xe4ec865188c3e2670e3c01c828100163ea51fbb3","0xc139b9a12f3d1cb09cba3e5c29f58f2cfdda944b","0xd640edb1b41c1b8e13df2249b36ca3e340a7398d","0x85a117cdc91e868555e2e9bbc00e04acaf82c38c",
    ]
    const uriList: string[] = []
    for (let i = 10;i <= 14;i++) {
      uriList.push(`https://nft2.blex.io/A/${i}.png`)
    }
    await mint(addressList,uriList)
  }

  // ===========================
  {
    // 交易先锋 nft1.blex.io/A-F/10-14.png
    const addressList = [
      "0xe4c4c3d2f86e46cba5527f60714464c138aadf9f","0x3e6a67361a08a5464f5b5774a5c44004acbf0346","0xd84b83bfe8f91d06566ec8d2b8b07bf0b28057b9","0x22fb429b42b43f161493f1179bb5b48f723cf5e8","0xa9135f186299cec31fd0d03359ab8bb41e611ab5",
    ]
    const uriList: string[] = []
    for (let i = 10;i <= 14;i++) {
      uriList.push(`https://nft2.blex.io/B/${i}.png`)
    }
    await mint(addressList,uriList)
  }

  // ===========================
  {
    // 交易先锋 nft1.blex.io/A-F/10-14.png
    const addressList = [
      "0x9c21ce8662322ed5c97996512cdf44d6a80bbf61","0x1b6975455ea0e249cf758d077374988540de05ad","0x991196648fb8f240a389f79d5cc41f4c26ab18c7","0x6545f8bea0c4453775731de08e119de9204fe182","0xf220ecfcacc6bce9058ee0b4e27e3f6f7f40646e",
    ]
    const uriList: string[] = []
    for (let i = 10;i <= 14;i++) {
      uriList.push(`https://nft2.blex.io/C/${i}.png`)
    }
    await mint(addressList,uriList)
  }

  // ===========================
  {
    // 交易先锋 nft1.blex.io/A-F/10-14.png
    const addressList = [
      "0x84df10a4a9c38cd95f0bdc1e8e18002900e1863c","0x59eaa988be0dfdf92ca7b73cd9f3a15697b2c8ed","0xcfa7622be719e1804ee550eeaa4eb084d550935f","0xc4bf9571586a748f6ca35e04f417e941b4cc8f89","0x4da48a65afb4bb6f70d2ba03229a8be158aa5b22",
    ]
    const uriList: string[] = []
    for (let i = 10;i <= 14;i++) {
      uriList.push(`https://nft2.blex.io/D/${i}.png`)
    }
    await mint(addressList,uriList)
  }

  // ===========================
  {
    // 交易先锋 nft1.blex.io/A-F/10-14.png
    const addressList = [
      "0x058487e42ce52d47794718a8df6cb1ef7d92a4f7","0x904c2547350e6772b7116b61176b6cad1bff634c","0x471846c1ef9d587b7b458c551c7c0ae6ef519c9c","0x95ad8360fe25bc9fb573d10b42f76f1bf34669af","0x0629907a87131db26b6bbc5a2e35f51886035fba",
    ]
    const uriList: string[] = []
    for (let i = 10;i <= 14;i++) {
      uriList.push(`https://nft2.blex.io/E/${i}.png`)
    }
    await mint(addressList,uriList)
  }


  // ===========================
  {
    // 交易先锋 nft1.blex.io/A-F/10-14.png
    const addressList = [
      "0xa4e411902bfc4e7d595e6b94f94232f27fe19709","0x751bbe37e787d8d8e426900daf0143e6974dc8de","0x2aaa50cbc0a72155bb1c9a8c7599858a02ff81a0","0x85afc33d6a9e0c8d784f51b966ae4b1325d5c324","0x6a166520138351bd62edead1a5f12609235c0ec6"

    ]
    const uriList: string[] = []
    for (let i = 10;i <= 14;i++) {
      uriList.push(`https://nft2.blex.io/F/${i}.png`)
    }
    await mint(addressList,uriList)
  }

  // ===========================
  // ===========================
  // ===========================
  // ===========================
  // ===========================
  // ===========================

  {
    // 交易大师 nft2.blex.io/A-F/01-09.png
    // read mint list from file
    const addressList = [
      "0xe4ec865188c3e2670e3c01c828100163ea51fbb3",
      "0x22fb429b42b43f161493f1179bb5b48f723cf5e8",
      "0x991196648fb8f240a389f79d5cc41f4c26ab18c7",
      "0xa9135f186299cec31fd0d03359ab8bb41e611ab5",
      "0x3e6a67361a08a5464f5b5774a5c44004acbf0346",
      "0xd84b83bfe8f91d06566ec8d2b8b07bf0b28057b9",
      "0xf220ecfcacc6bce9058ee0b4e27e3f6f7f40646e",
      "0x84df10a4a9c38cd95f0bdc1e8e18002900e1863c",
      "0x058487e42ce52d47794718a8df6cb1ef7d92a4f7",
    ];
    const uriList: string[] = []
    for (let i = 1;i <= 9;i++) {
      uriList.push(`https://nft1.blex.io/A/0${i}.png`)
    }
    await mint(addressList,uriList)
  }

  // ===========================
  {
    // 交易大师 nft2.blex.io/A-F/01-09.png
    const addressList = [
      "0xe4c4c3d2f86e46cba5527f60714464c138aadf9f",
      "0x6545f8bea0c4453775731de08e119de9204fe182",
      "0x9c21ce8662322ed5c97996512cdf44d6a80bbf61",
      "0x85a117cdc91e868555e2e9bbc00e04acaf82c38c"
    ]
    const uriList: string[] = []
    for (let i = 1;i <= 4;i++) {
      uriList.push(`https://nft1.blex.io/B/0${i}.png`)
    }
    await mint(addressList,uriList)
  }

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
