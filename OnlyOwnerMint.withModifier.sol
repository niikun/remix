// SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMintwithModifier is ERC721 {
    /**
     * @dev
     * -このコントラクトをデプロイしたアドレス用変数 owner
    */
    address public owner;

    constructor() ERC721("OnlyOwnerMintwithModifier", "OWNERWM") {
        owner = _msgSender();
    }

        /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけに限定　Modifier onlyOwner　を設定
    */
    modifier onlyOwner{
        require(
            owner==_msgSender(),"Caller is not owner.");
        _;
    }

    /** 
     * @dev
     * -NFTMint関数の実行アドレスにtokenIdを紐づけ
    */

    function nftMint(uint256 tokenId)public onlyOwner{
        _mint(_msgSender(), tokenId);
    }

}