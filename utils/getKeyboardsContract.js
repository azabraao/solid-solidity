import { ethers } from "ethers";

import abi from "../utils/Keyboards.json";

const contractAddress = "0x7D0a1F9d1DFDcBA4e9e21ED5698C3F3a7Cfb1FBA";
const contractABI = abi.abi;

export default function getKeyboardsContract(ethereum) {
  if (ethereum) {
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    return new ethers.Contract(contractAddress, contractABI, signer);
  } else {
    return undefined;
  }
}
