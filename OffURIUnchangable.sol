// SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";

contract OffURIUnchangable is ERC721URIStorage, Ownable {

    constructor() ERC721("OffURIUnchangable", "OFFU") {}

    /** 
     * @dev
     * - NFTMint関数の実行アドレスにtokenIdを紐づけ
     * - Mint時にuriを設定する 
    */

    function nftMint(uint256 tokenId, string calldata uri) public onlyOwner{
        _mint(_msgSender(), tokenId);
        _setTokenURI(tokenId, uri);
    }

}