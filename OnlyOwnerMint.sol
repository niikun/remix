// SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMint is ERC721 {
    /**
     * @dev
     * -このコントラクトをデプロイしたアドレス用変数 owner
    */
    address public owner;
    /**
     * @dev
     * -Modifier onlyOwner　を設定
    */
    // modifier{
    //     require(owner==_msgSender(),"Caller is not owner.");
    //     _;
    // }



    constructor() ERC721("OnlyOwnerMint", "OWNER") {
        owner = _msgSender();
    }

    /** 
     * @dev
     * -このコントラクトをデプロイしたアドレスだけがmint　可能
     * -NFTMint関数の実行アドレスにtokenIdを紐づけ
    */

    function nftMint(uint256 tokenId)public {
        require(owner==_msgSender(),"Caller is not the owner.");
        _mint(_msgSender(), tokenId);
    }

}