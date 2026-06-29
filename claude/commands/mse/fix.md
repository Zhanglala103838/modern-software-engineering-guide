---
description: 挑当前项目"风险下降/投入"最高的一条改进并落地
argument-hint: "[可选:指定要修的方向,如 working-tree / ci / deps / secrets]"
---

先调用 skill `engineering-standards`。

对当前项目:
1. 若给了 `$ARGUMENTS` 就修那个方向;否则先轻量体检定段位,挑**风险下降/投入最高的一条**(棕地通常是:先把未提交收干净让"生产==已知 commit" → 废 .bak → 锁依赖 → 加 CI gate → 密钥出源码)。
2. 说明"为什么是这条最高 ROI"(对应 SPEC 哪条),给一句话计划,等我确认。
3. 落地这一条,小步、可验证;遵守规范本身(改完即提交、commit message 写清为什么、不夹带无关改动)。
4. 一次只做一条;做完报告 + 给下一条候选。**绝不重写、不大爆炸改造**(尤其棕地)。
