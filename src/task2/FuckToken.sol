// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract FuckToken {
    string public name = "FuckToken";
    string public symbol = "FUT";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public immutable owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        owner = msg.sender;
    }
    
    // balance of
    function banlanceOf(address _user) external view returns (uint256) {
        return balanceOf[_user];
    }

    // transfer
    function transfer(address _to, uint256 _amount) external {
        require(_to != address(0x0), "Invalid address");
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        require(_amount > 0, "Amount must be greater than 0");

        uint256 previousBalance = balanceOf[msg.sender] + balanceOf[_to];
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);

        assert(balanceOf[msg.sender] + balanceOf[_to] == previousBalance);
    }

    // approve
    function approve(address _spender, uint256 _amount) external {
        require(_spender != address(0x0), "Invalid address");
        require(_amount > 0, "Amount must be greater than 0");

        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
    }
    // transferFrom
    function transferFrom(address _from, address _to, uint256 _amount) external {
        require(_to != address(0x0), "Invalid address");
        require(_amount > 0, "Amount must be greater than 0");
        require(_amount <= allowance[_from][msg.sender], "Insufficient allowance");
        require(_amount <= balanceOf[_from], "Insufficient balance");

        uint256 previousBalance = balanceOf[_from] + balanceOf[_to];
        allowance[_from][msg.sender] -= _amount;
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(_from, _to, _amount);

        assert(balanceOf[_from] + balanceOf[_to] == previousBalance);
    }
    //mint
    function mint(address _to, uint256 _amount) external onlyOwner {
        require(_to != address(0x0), "Invalid address");
        require(_amount > 0, "Amount must be greater than 0");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0x0), _to, _amount);
    }


    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}

//ether scan: https://sepolia.etherscan.io/address/0x59cfef67f25d72f7b279c28f32b965796083f92d