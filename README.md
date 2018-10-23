# Solidity 智能合约常见漏洞

contracts 目录下列举了一些常见的 solidity 智能安全漏洞

| 文件              | 漏洞                              |
| ----------------- | --------------------------------- |
| delegatecall.sol  | delegatecall 调用不可信的外部合约 |
| dos.sol           | 拒绝服务                          |
| front-running.sol | 预先交易                          |
| overflow.sol      | 整型溢出                          |
| public-data.sol   | 链上数据都是公开的                |
| reentry.sol       | 重入攻击                          |
| timestamp.sol     | 随机数                            |
| tx.origin         | 避免使用 tx.origin                |
| zero-balance.sol  | 意外转账                          |
