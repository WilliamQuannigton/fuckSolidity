# Solidity 算法题练习项目

这是一个使用 Foundry 框架的 Solidity 项目，专门用于练习和解决各种算法题。

## 项目结构

```
├── src/
│   └── AlgorithmSolutions.sol    # 主要算法实现
├── test/
│   └── AlgorithmSolutions.t.sol  # 测试文件
├── script/
│   └── Deploy.s.sol             # 部署脚本
├── foundry.toml                 # Foundry 配置
└── README.md                    # 项目说明
```

## 已实现的算法


## 如何运行

### 1. 安装 Foundry

如果你还没有安装 Foundry，请先安装：

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### 2. 安装依赖

```bash
forge install
```

### 3. 编译合约

```bash
forge build
```

### 4. 运行测试

```bash
# 运行所有测试
forge test

# 运行特定测试
forge test --match-test testFibonacci

# 运行测试并显示详细输出
forge test -vvv

# 运行模糊测试
forge test --fuzz-runs 1000
```

### 5. 运行测试并生成覆盖率报告

```bash
forge coverage
```

### 6. 部署合约

```bash
# 设置环境变量
export PRIVATE_KEY=your_private_key_here

# 部署到本地网络
forge script script/Deploy.s.sol --rpc-url http://localhost:8545 --broadcast

# 部署到测试网
forge script script/Deploy.s.sol --rpc-url $RPC_URL --broadcast --verify
```

## 添加新的算法题

1. 在 `src/AlgorithmSolutions.sol` 中添加新的函数
2. 在 `test/AlgorithmSolutions.t.sol` 中添加对应的测试
3. 运行测试确保功能正确

### 示例：添加新的算法

```solidity
// 在 AlgorithmSolutions.sol 中添加
function binarySearch(uint256[] memory arr, uint256 target) public pure returns (int256) {
    uint256 left = 0;
    uint256 right = arr.length - 1;
    
    while (left <= right) {
        uint256 mid = left + (right - left) / 2;
        
        if (arr[mid] == target) {
            return int256(mid);
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return -1; // 未找到
}
```

## 测试策略

- **单元测试** - 测试每个函数的正确性
- **边界测试** - 测试边界条件和异常情况
- **模糊测试** - 使用随机输入测试函数性质
- **集成测试** - 测试多个函数的组合使用

## 性能优化

在 Solidity 中编写算法时，需要注意：

1. **Gas 优化** - 减少不必要的存储操作
2. **溢出检查** - 使用 SafeMath 或 Solidity 0.8+ 的自动检查
3. **内存管理** - 合理使用 memory 和 storage
4. **循环优化** - 避免无限循环和过深的递归

## 贡献

欢迎提交新的算法实现和测试用例！

## 许可证

MIT License
