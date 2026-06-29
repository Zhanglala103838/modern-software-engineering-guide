---
description: 把工程规范落地进当前 repo(CONTRIBUTING + PR 模板 + 在 CLAUDE.md 标注段位)
argument-hint: "[可选:项目路径,默认当前目录]"
---

先调用 skill `engineering-standards`。

对目标 repo(`$ARGUMENTS` 或当前目录),把规范落到本仓库一层(人 + AI 都能看):

1. 先跑一次轻量体检定段位(git status / CI / 测试 / 最大文件)。
2. 复制规范配套文件进本 repo(稳定源在 skill 目录):
   - `cp ~/.claude/skills/engineering-standards/templates/CONTRIBUTING.md ./CONTRIBUTING.md`
   - `mkdir -p .github && cp ~/.claude/skills/engineering-standards/templates/.github/pull_request_template.md .github/`
3. 在该 repo 的 `CLAUDE.md`(无则建)或 `AGENTS.md` 顶部加一行:
   `> 工程规范见 skill engineering-standards;本项目段位=<🧱/🏗️/✅/🛡️>,优先用 SPEC 第X部分。`
4. 不动业务代码;只加这几样 + 报告做了什么。若 repo 已有自己的 harness/规范,**以它为先**,本规范作兜底基线,不覆盖。
