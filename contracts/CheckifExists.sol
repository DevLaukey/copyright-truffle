//SPDX // SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.5;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract VRToken {
    // code to define the token's properties
    address[] existingTokens;

    //create a constructor


    function addExistingToken(address _token) public {
        existingTokens.push(_token);
    }

    function isDuplicate(address _newToken) public view returns (bool) {
        for (uint i = 0; i < existingTokens.length; i++) {
            if (compareVRAssets(existingTokens[i], _newToken)) {
                return true;
            }
        }
        return false;
    }
    // other functions

   function compareVRAssets(address _asset1, address _asset2) public view returns (bool) {
        // Compare the VR assets' hashes
        Token  t1 = Token(_asset1);
        Token  t2 = Token(_asset2);

        return t1.nameHash == t2.nameHash && t1.symbolHash == t2.symbolHash && t1.totalSupply == t2.totalSupply;
    }
}

contract Example {
    VRToken comparator = new VRToken();

    function createAndCompareTokens() public view returns (bool) {
        Token token1 = new Token("Token 1", "T1", 100);
        Token token2 = new Token("Token 2", "T2", 200);

        return comparator.compareVRAssets(address(token1), address(token2));
    }
}


contract Token {
    bytes32 public nameHash;
    bytes32 public symbolHash;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) public {
        nameHash = keccak256(abi.encodePacked(_name));
        symbolHash = keccak256(abi.encodePacked(_symbol));
        totalSupply = _totalSupply;
    }
}


contract Copyright {
    // Events
    event NewAsset( 
        string indexed assetId,
        string indexed author,
        uint256 indexed timestamp
    );
    event AssetTransfer(
        string indexed assetId, 
        address indexed from,
        address indexed to
    );
    event AssetModified(string indexed assetId, string content);

    // Struct to store information about a copyrighted asset
    struct Asset {
        string id;
        string author;
        string content;
        uint256 timestamp;
        address owner;
    }

    // Mapping to store the assets
    mapping(string => Asset) public assets;

    // Function to register a new copyrighted asset
    function registerAsset(
        string memory _id,
        string memory _author,
        string memory _content
    ) public {
        // require(assets[_id].id == "", "Asset already exists");

        // Get the current timestamp
        uint256 timestamp = block.timestamp;

        // Create a new asset
        Asset memory asset = Asset(
            _id,
            _author,
            _content,
            timestamp,
            msg.sender
        );

        // Add the asset to the mapping
        assets[_id] = asset;

        // Emit an event to notify about the new asset
        emit NewAsset(_id, _author, timestamp);
    }

    // Function to transfer ownership of an asset
    function transferAsset(string memory _id, address _to) public {
        require(
            msg.sender == assets[_id].owner,
            "Sender is not the owner of the asset"
        );
        require(_to != address(0), "Invalid address");

        // Update the owner of the asset
        assets[_id].owner = _to;

        // Emit an event to notify about the transfer
        emit AssetTransfer(_id, msg.sender, _to);
    }

    // Function to modify the content of an asset
    function modifyAsset(string memory _id, string memory _content) public {
        require(
            msg.sender == assets[_id].owner,
            "Sender is not the owner of the asset"
        );

        // Update the content of the asset
        assets[_id].content = _content;

        // Emit an event to notify about the modification
        emit AssetModified(_id, _content);
    }

    // function to view all the assets
    function viewAllAssets() public view returns (Asset[] memory) {
   
    }
}