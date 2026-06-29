# Modern Software Engineering Guide

> 一套**可落地、可勾选**的「代码开发 + Code Review」工程规范。
> 理论基础:David Farley《[Modern Software Engineering](https://www.davefarley.net/?p=352)》(2021)。
> 不是哲学口号,而是能直接贴进团队仓库的 checklist。

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](./LICENSE)
[![Version](https://img.shields.io/badge/version-v1.0-brightgreen.svg)](./CHANGELOG.md)

---

## 这是什么

软件工程不该是"照搬制造业流水线",而是一门**用科学方法驾驭复杂、不确定系统**的应用学科。
本规范把 Farley 的核心理念拆成日常开发与 review 中**可执行的条目**:

- **两大支柱**
  - 🧠 **为学习优化(Optimize for Learning)** — 迭代、反馈、实验、经验主义、TDD
  - 🧩 **为管理复杂度优化(Optimize for Managing Complexity)** — 模块化、内聚、关注点分离、抽象、管理耦合
- **两块试金石**
  - ✅ **可测试性(Testability)** 与 🚀 **可部署性(Deployability)** — 难测、难部署,几乎等于设计有问题
- **一条元原则**
  - 🧭 **上下文优先(Context First)** — 规则是默认值不是教条;规范本身也是可迭代、可反馈的制品

---

## 仓库结构

| 文件 | 用途 |
|------|------|
| **[SPEC.md](./SPEC.md)** | 完整规范(10 部分,见下) |
| **[CONTRIBUTING.md](./CONTRIBUTING.md)** | 可直接贴进你项目的开发&贡献规范,也是为本仓库贡献的指南 |
| **[.github/pull_request_template.md](./.github/pull_request_template.md)** | PR 自查模板,从规范派生 |
| **[CHANGELOG.md](./CHANGELOG.md)** | 规范演进记录(v0.1 → v1.0,每条改动的来源) |
| **[LICENSE](./LICENSE)** | CC BY 4.0 |

### 规范十部分一览([SPEC.md](./SPEC.md))

| # | 部分 | 核心 |
|---|------|------|
| ✳️ | 元原则·上下文优先 | 规则是默认值不是教条;规范本身是可迭代制品 |
| 1 | 代码开发(为学习优化) | 迭代/反馈/实验/TDD · 工作区近零 · 测试必须有门禁 |
| 2 | 代码设计(为管理复杂度) | 模块化/内聚/分离/抽象/管理耦合 · 责任爆炸半径 |
| 3 | 两块试金石 | 可测试性 + 可部署性(迁移契约/CD gate/依赖可复现/密钥不入源码/12-factor) |
| 4 | Code Review 规范 | 作者自查 + Reviewer 清单 + 对事不对人文化 |
| 5 | 健康度量 | DORA 四指标 + SLO 与错误预算(SRE) |
| 6 | 落地路线 | 三阶段渐进,别一步到位 |
| 7 | 架构治理即代码 | fitness functions / SSOT 扫描器 / 风险路由 review |
| 8 | 棕地 / 遗留系统适配 | 最小安全网,绝不重写 |
| 9 | 跨服务与共享数据 | 共享 DB=隐式契约 / expand-contract / 契约测试 |
| 10 | 安全基线 | OWASP ASVS 分级 + must-fix |

> **怎么造出来的**:用真实项目当反例库(脱敏)+ 业界标杆当正例(具名)反复证伪迭代——途中规范甚至**纠正过自己上一版的规则**。锚定标杆:Farley · ArchUnit · Pact · strong_migrations · OpenTelemetry · OpenFeature · Testcontainers · trunk-based · Cockburn · Google SRE · OWASP ASVS · 12-factor。

---

## 怎么用

1. **快速上手**:把 [`.github/pull_request_template.md`](./.github/pull_request_template.md) 放进你的仓库,新建 PR 时自动带出自查清单。
2. **团队规范**:把 [`SPEC.md`](./SPEC.md) 作为团队工程公约,或精简版 [`CONTRIBUTING.md`](./CONTRIBUTING.md) 放仓库根目录。
3. **分阶段落地**:不要一步到位。按 SPEC「第六部分·落地路线」三阶段渐进——先建反馈与 Review 文化,再解耦与可独立部署,最后主干开发 + DORA 度量。

> ⚠️ 本规范要求一定的工程基础(秒级测试、稳定快速 CI、特性开关 + 监控)。基础设施不匹配就硬推只会带来挫败感——把它当"目标态蓝图",逐步投资。

---

## 在 Claude Code 里用(skill + `/mse` 命令)

本仓库自带一套 [Claude Code](https://claude.com/claude-code) 集成,装上后让 AI **每次写/审代码都按规范工作**,并给你一组斜杠命令。

```bash
git clone https://github.com/Zhanglala103838/modern-software-engineering-guide.git
cd modern-software-engineering-guide
bash claude/install.sh        # 装进 ~/.claude/(可重复运行)
```

装好后得到:

**① skill `engineering-standards`** —— 写/改/审代码时自动加载规范(spectrum-routed:先定段位再套规则)。

**② 斜杠命令(显式调用):**

| 命令 | 作用 |
|------|------|
| `/mse:check` | 给当前项目**定段位** + 风险下降/投入最高的 top3 行动(只读) |
| `/mse:review` | 按规范 review 当前改动或指定 PR(试金石 + Reviewer 清单) |
| `/mse:init` | 新项目按**绿地目标态**起步(CI + 测试 + 锁依赖 + 密钥进 env) |
| `/mse:onboard` | 把 CONTRIBUTING + PR 模板 + 段位标注落进当前 repo |
| `/mse:fix` | 挑一条最高 ROI 改进并落地(棕地优先收未提交/加 CI…) |

**③(可选)让每个 session 都自动想起规范** —— 在全局 `~/.claude/CLAUDE.md`(或 `~/CLAUDE.md`)加一段指针:

```markdown
### 工程规范基线(开发 + Review · 强制)
写/改/审代码、开 PR、重构、起新项目前,先调 skill `engineering-standards`。
先定段位再套规则(git status + CI/测试/最大文件):🧱棕地→第八部分最小安全网;✅绿地→第一/二/三部分。
新项目按绿地目标态起步;老项目绝不重写,按"风险下降/投入"排序。元原则:上下文优先,规则是默认值不是教条。
```

> 其他 AI 编码工具(Cursor / Copilot / Codex 等):直接把 [`SPEC.md`](./SPEC.md) 或 [`CONTRIBUTING.md`](./CONTRIBUTING.md) 放进项目根目录 / 规则文件即可,命令是 Claude Code 专属。

---

## 规范成长光谱(用它给项目体检)

本规范不是空想,而是用真实项目反复证伪、迭代出来的。它覆盖一条从**棕地地板**到**绿地天花板**的完整光谱——给任何项目体检时,先定位它在光谱的哪一段,再用对应章节,而不是一上来就要求满分:

| 段位 | 典型特征 | 先用哪几节 | 头号该做的事 |
|------|---------|-----------|-------------|
| 🧱 **棕地地板** | 生产直改 / 大量未提交 / 无 CI 无测试 / `.bak` 备份 / god 文件 | **第八部分** | 先让"生产 == 已知 commit",拿到可复现+可回滚+审计 |
| 🏗️ **过渡期** | 有 git 与基本测试,但 CI/解耦不全 | 第一/二/四部分 | 建反馈与 Review 文化,关键路径补测试 |
| ✅ **绿地达标** | 快测 + 稳定 CI + 分层 + 可独立部署 | 第三/五/六部分 | 主干开发 + DORA 度量 + 可部署性硬化 |
| 🛡️ **治理天花板** | 分层架构 / 多人或 AI 协作 | **第七部分** | 架构治理即代码(fitness functions / SSOT 扫描器 / 风险路由) |

> 体检三步:① 跑 `git status`、查有无 CI/测试、看最大文件——给项目定段位;② 翻对应章节的 checklist;③ 只挑"风险下降/投入"最高的一两条先做。**别用绿地标准苛求棕地项目。**

---

## 一句话速记

> **小步迭代拿反馈,科学实验做决策,死磕复杂度;
> 写之前先问"怎么测、怎么部署",PR 小而清,Review 对事不对人、有分歧就用证据。**

---

## License

本作品采用 [Creative Commons Attribution 4.0 International (CC BY 4.0)](./LICENSE) 授权——可自由使用、改编、再分发,需署名。

理论来源:David Farley, *Modern Software Engineering: Doing What Works to Build Better Software Faster*, Addison-Wesley, 2021. 本规范是对其理念的**独立提炼与实践落地**,非原书内容复制。
