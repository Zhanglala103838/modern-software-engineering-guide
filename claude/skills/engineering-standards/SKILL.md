---
name: engineering-standards
description: Use BEFORE writing, modifying, reviewing, or refactoring code, opening a PR, or starting/auditing any project. The team's code dev + review standard, based on David Farley's Modern Software Engineering. Spectrum-routed — brownfield/legacy floor → governance ceiling. Triggers — "写代码/改代码/code review/PR/重构/新项目/老项目/审一下/工程规范".
---

# 工程规范:代码开发 + Review(spectrum-routed)

> 完整规范见同目录 `SPEC.md`(10 部分,317 行)。本文件是**路由 + 必查精华**;需要某一部分细节时再读 `SPEC.md` 对应章节。
> 源仓库:https://github.com/Zhanglala103838/modern-software-engineering-guide

## 第 0 步:先给项目定段位(别用绿地标准苛求棕地)

跑 `git status`(看未提交数)+ 查有无 CI/测试 + 看最大文件,定位段位:

| 段位 | 特征 | 先用 SPEC 哪几部分 | 头号该做 |
|---|---|---|---|
| 🧱 棕地地板 | 生产直改 / 大量未提交 / 无 CI 无测试 / `.bak` / god 文件 | **第八部分** | 先让"生产==已知 commit"(可复现+回滚+审计) |
| 🏗️ 过渡 | 有 git+基本测试,CI/解耦不全 | 第一/二/四部分 | 建反馈与 Review 文化,关键路径补测试 |
| ✅ 绿地 | 快测+稳定 CI+分层+可独立部署 | 第三/五/六部分 | 主干开发 + DORA/SLO + 可部署性硬化 |
| 🛡️ 治理天花板 | 分层/多人或 AI 协作 | 第七部分 | 架构治理即代码(fitness functions/SSOT 扫描/风险路由) |

- **新项目**:按绿地目标态起步——第一天就配 CI+测试框架+lock 依赖+密钥进 env;直接用第一/二/三部分 + PR 模板。
- **老项目**:从第八部分最小安全网开始,按"风险下降/投入"排序,**绝不重写**;逐步往上爬段位。

## 写/改代码时(必查精华)

- 小步可独立验证的增量;工作区保持近零(未提交=风险)。
- **难测 = 设计问题**,回头改设计,而非"补个测试就行"。
- 职责单一、内聚;业务逻辑与框架/IO/DB 分离;警惕以"复用"之名制造耦合。
- 错误不许静默吞掉;关键业务边界/外部 errcode/时间窗/隐式契约 **inline 注释**。
- 改 bug 先写能复现的失败测试再修。

## 两块试金石(完成定义必查)

- **可测试**:不接真实外部系统即可测、确定性、无 flaky;安全/权限边界有专门测试。
- **可部署**:能独立部署/回滚;迁移 ordered+幂等+N-1 兼容;依赖锁精确版本;**密钥不入源码**;CD 必须 gate(跑同款检查)。

## Review 时

- 有覆盖行为+边界的测试?抽象恰当(不过度/不投机)?耦合必要?难测→标记设计问题。
- 对事不对人,给理由和替代;区分 must-fix vs nit;**有分歧用最小实验/数据裁决,不靠职级压人**。

## 元原则(凌驾所有规则)

**上下文优先**:规则是默认值不是教条。某条明显阻碍"为学习优化 / 为管理复杂度优化"两个目标时,团队可在共识+记录理由后打破它并复盘。**别对单文件小工具套第七/九部分,别对棕地套绿地标准。**

## 进阶部分(按需读 SPEC.md)

- 第七部分 架构治理即代码 · 第九部分 跨服务/共享数据(多语言共库)· 第十部分 安全基线(OWASP ASVS 分级)· 第五部分 SLO 与错误预算。
