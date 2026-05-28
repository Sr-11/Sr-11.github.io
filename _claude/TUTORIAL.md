# 网站使用教程

## 核心思想

内容与样式分离。样式主题帮你搞定，你只需要改这几个文件：

```
_config.yml                   全局设置（姓名、邮箱、社交链接）
_pages/about.md               首页自我介绍
_data/cv.yml                  CV 页面数据
_bibliography/papers.bib      论文列表
_posts/                       博客文章
assets/img/prof_pic.jpg       头像
```

改完后 `git push`，等约 4 分钟，网站自动更新。

---

## _config.yml — 全局设置

### 已填好的
```yaml
first_name: Rui
last_name: Sun
email: eruisun at stanford dot edu
url: https://sr-11.github.io/
scholar_userid: DNoO_lYAAAAJ
```

### 可以补充的社交链接（填了就在首页底部显示图标）
```yaml
github_username: Sr-11
x_username: 你的推特 handle
linkedin_username: 你的 LinkedIn
```

### 首页功能开关（在 _pages/about.md 的头部）
```yaml
news: false           # 改 true 显示 News 栏
selected_papers: false  # 改 true 显示精选论文
social: true          # 首页底部社交图标
```

---

## _pages/about.md — 首页

```markdown
---
layout: about
profile:
  image: prof_pic.jpg   # 头像文件名，放到 assets/img/ 下
  align: right
news: false
selected_papers: false
social: true
---

正文用普通 Markdown 写...
```

**换头像**：把照片命名为 `prof_pic.jpg`，放到 `assets/img/` 覆盖原文件。

---

## _data/cv.yml — CV 页面

当前是 Einstein 占位数据，按如下格式替换：

```yaml
- title: General Information
  type: map
  contents:
    - name: Full Name
      value: Rui Sun
    - name: Email
      value: eruisun@stanford.edu

- title: Education
  type: time_table
  contents:
    - title: Ph.D. in Statistics
      institution: Stanford University
      year: 2024 - present
      description:
        - Advisor: XX
    - title: B.S. in Mathematics and Physics
      institution: MIT
      year: 2020 - 2024

- title: Honors and Awards
  type: time_table
  contents:
    - year: 2020
      items:
        - Gold Medal, International Physics Olympiad (IPhO)
```

支持的 type 类型：
- `map` — 键值对（联系方式、语言等）
- `time_table` — 时间线（教育、工作经历）
- `nested_list` — 嵌套列表（研究兴趣）
- `list` — 简单列表（爱好）

---

## _bibliography/papers.bib — 论文

```bibtex
@article{sun2024yourpaper,
  title    = {Your Paper Title},
  author   = {Sun, Rui and Coauthor, Name},
  journal  = {Journal Name},
  year     = {2024},
  abbr     = {NeurIPS},        # 左侧显示的徽章
  pdf      = {your_paper.pdf}, # 文件放到 assets/pdf/
  selected = {true}            # 加这行 → 在首页精选论文显示
}
```

没有论文的话可以删掉 Einstein 的占位条目，或直接留着不影响其他功能。

---

## _posts/ — 博客文章

文件命名必须是 `YYYY-MM-DD-title.md`：

```markdown
---
layout: post
title: 我的第一篇文章
date: 2025-05-28
tags: [math, thoughts]
published: true    # 必须是 true 才会显示
---

正文用 Markdown 写，支持 LaTeX：

行内公式：$E = mc^2$

独立公式：
$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$
```

注意：现有的 3 篇文章都是 `published: false`，改成 `true` 就会出现在博客页面。

---

## 本地预览

```bash
docker compose up
# 打开 http://localhost:8080
# 修改文件后自动热更新，不需要重启
```

---

## 部署

```bash
git add -A
git commit -m "描述你改了什么"
git push
# 等约 4 分钟，https://sr-11.github.io 自动更新
```

---

## 当前待完善的事项

- [ ] 换头像：`assets/img/prof_pic.jpg`
- [ ] 补充社交链接：`_config.yml`
- [ ] 更新 CV：`_data/cv.yml`（替换 Einstein 占位数据）
- [ ] 发布博客文章：3 篇文章改 `published: true`
- [ ] 添加论文（有发表物的话）：`_bibliography/papers.bib`
