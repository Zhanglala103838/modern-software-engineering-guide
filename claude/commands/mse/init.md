---
description: 新项目按绿地目标态起步(CI + 测试框架 + 锁依赖 + 密钥进 env + 规范落地)
argument-hint: "[可选:项目路径,默认当前目录]"
---

先调用 skill `engineering-standards`。这是**新项目**,目标是开局即 ✅ 绿地,不欠债。

对目标项目(`$ARGUMENTS` 或当前目录),先看清技术栈,再按 SPEC 第一/二/三部分把基线配齐(做之前先简述计划让我确认,逐项做完报告):

1. **依赖可复现**:确保 lock 文件入库,锁精确版本;禁 dev-master/latest/SNAPSHOT。
2. **测试框架**:为该栈搭好测试框架 + 1 个示例测试 + 一条命令跑全量(秒级反馈);难测的栈(小程序/原生/桌面)也要把 harness 搭起来。
3. **CI 门禁**:加 CI(typecheck/lint/test 必须 gate;不是只 build);CD 跑同款检查 + 构建前校验必需 env。
4. **配置与密钥**:配置进 env,密钥进 env/vault,绝不提交;`.gitignore` 排除产物/备份/生成物。
5. **规范落地**:复制 CONTRIBUTING.md + PR 模板进 repo,在其 CLAUDE.md/AGENTS.md 标注"段位=✅绿地、用 SPEC 第X部分"。

复杂分层/多服务再按需引入第七/九部分。每步等可验证后再下一步。
