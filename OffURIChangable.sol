// SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";

contract OffURIChangable is ERC721URIStorage, Ownable {

    constructor() ERC721("OffURIChangable", "OFFC") {}

    /** 
     * @dev
     * -NFTMint関数の実行アドレスにtokenIdを紐づけ
    */

    function nftMint(uint256 tokenId)public onlyOwner{
        _mint(_msgSender(), tokenId);
    }

    /**
     *@dev
     * -既存のtokenIdにURIを紐づけ
     */

    function setTokenURI(uint256 tokenId, string calldata uri)public onlyOwner{
        _setTokenURI(tokenId, uri);
    }

}