// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LabubuNftToken is ERC721, Ownable {

    error Nft__TokenUriNotFound();
    

    mapping(uint256 tokenId => string tokenURI) public tokenURIs;

    uint256 private s_tokenCounter;

    constructor() ERC721("LabubuNftToken", "LBNFT") Ownable(msg.sender) {
        s_tokenCounter = 0;
    }

    function mint(string memory _tokenURI) external onlyOwner {
        uint256 tokenId = s_tokenCounter;
        _safeMint(msg.sender, tokenId);
        tokenURIs[tokenId] = _tokenURI;
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert Nft__TokenUriNotFound();
        }
        return tokenURIs[tokenId];
    }

    function getTokenCounter() public view returns(uint256) {
        return s_tokenCounter;
    }
}

//ether scan: https://sepolia.etherscan.io/token/0x498cdba69d878c90b4907fb1fff2530715c420ee