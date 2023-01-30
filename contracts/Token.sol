pragma solidity 0.8.5;

contract Token {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) public {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }
}

contract TokenComparator {
    function areTokensEqual(address token1, address token2) public view returns (bool) {
        Token storage t1 = Token(token1);
        Token storage t2 = Token(token2);

        return t1.name == t2.name && t1.symbol == t2.symbol && t1.totalSupply == t2.totalSupply;
    }
}
