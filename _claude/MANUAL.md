# 个人学术网站使用手册

> 基于 [al-folio](https://github.com/alshedivat/al-folio) 主题，部署于 https://sr-11.github.io

---

## 目录

1. [工作原理](#1-工作原理)
2. [文件结构](#2-文件结构)
3. [全局配置 _config.yml](#3-全局配置)
4. [首页](#4-首页)
5. [CV 页面](#5-cv-页面)
6. [论文页面](#6-论文页面)
7. [博客文章](#7-博客文章)
8. [项目页面](#8-项目页面)
9. [图片与资源](#9-图片与资源)
10. [本地预览](#10-本地预览)
11. [部署](#11-部署)
12. [待办清单](#12-待办清单)

---

## 1. 工作原理

```
你修改文件
    ↓
git push 到 GitHub
    ↓
GitHub Actions 自动构建（约 4 分钟）
    ↓
https://sr-11.github.io 更新
```

Jekyll 读取你的内容文件（Markdown、YAML、BibTeX），套上主题模板，生成静态 HTML。你不需要写 HTML 或 CSS。

---

## 2. 文件结构

```
Sr-11.github.io/
│
├── _config.yml              ← 全局设置（最重要）
│
├── _pages/                  ← 网站的各个页面
│   ├── about.md             ← 首页（/）
│   ├── cv.md                ← CV 页面（/cv/）
│   ├── blog.md              ← 博客列表页（/blog/）
│   └── random.md            ← Random 页面（/random/）
│
├── _posts/                  ← 博客文章
│   └── YYYY-MM-DD-title.md
│
├── _projects/               ← 项目展示
│   └── 1_project.md
│
├── _data/
│   └── cv.yml               ← CV 内容数据
│
├── _bibliography/
│   └── papers.bib           ← 论文列表（BibTeX 格式）
│
└── assets/
    ├── img/
    │   └── prof_pic.jpg     ← 头像
    └── pdf/                 ← 论文 PDF 文件
```

---

## 3. 全局配置

文件：`_config.yml`

### 基本信息

```yaml
first_name: Rui
last_name: Sun
email: eruisun at stanford dot edu
url: https://sr-11.github.io/
```

### 社交链接（填了就在首页底部显示图标）

```yaml
github_username: Sr-11
scholar_userid: DNoO_lYAAAAJ    # 已填
x_username:                     # 推特 handle
linkedin_username:              # LinkedIn
```

### 博客评论（可选，需要配置 giscus）

```yaml
giscus:
  repo: Sr-11/Sr-11.github.io
  # 其余字段按 https://giscus.app/ 生成
```

---

## 4. 首页

文件：`_pages/about.md`

### 头部配置

```yaml
---
layout: about
profile:
  image: prof_pic.jpg     # 头像文件名
  align: right            # 头像靠右（也可以 left）
  image_circular: false   # true 则裁剪为圆形
news: false               # true 显示 News 栏
selected_papers: false    # true 显示精选论文
social: true              # 首页底部社交图标
nav_order: 1              # 导航栏排序
---
```

### 正文

头部下方直接写 Markdown，即首页正文。支持：

- 标准 Markdown（标题、加粗、列表、链接）
- HTML 标签（如 `<br />` 换行）
- LaTeX 公式（行内 `$...$`，独立 `$$...$$`）

### 换头像

把照片文件命名为 `prof_pic.jpg`，放到 `assets/img/` 目录，覆盖原文件即可。

---

## 5. CV 页面

### 跳转模式（当前配置）

文件：`_pages/cv.md`

```yaml
redirect_to: https://docs.google.com/document/d/...
```

当前 CV 页面直接跳转到 Google Doc，访客点击 CV 会跳到你的 Google 文档。

### 切换为内置渲染模式

如果想在网站内展示 CV，删除 `redirect_to` 那一行，然后编辑 `_data/cv.yml`：

```yaml
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

- title: Research Interests
  type: nested_list
  contents:
    - title: Statistics & Machine Learning
      items:
        - Statistical learning theory
        - High-dimensional statistics
```

`type` 可选值：

| type | 用途 |
|---|---|
| `map` | 键值对，如联系方式 |
| `time_table` | 时间线，如教育、工作经历 |
| `nested_list` | 嵌套列表，如研究兴趣 |
| `list` | 简单列表，如爱好 |

---

## 6. 论文页面

文件：`_bibliography/papers.bib`

### 添加一篇论文

```bibtex
@article{sun2024example,
  title    = {论文标题},
  author   = {Sun, Rui and Coauthor, Name},
  journal  = {期刊或会议名},
  year     = {2024},

  abbr     = {NeurIPS},        % 左侧显示的徽章
  pdf      = {sun2024.pdf},    % PDF 文件放到 assets/pdf/
  html     = {https://...},    % 论文链接
  code     = {https://github.com/...},
  abstract = {摘要文字...},
  selected = {true}            % 加这行 → 在首页精选论文中显示
}
```

### 在首页显示精选论文

1. 给目标论文加 `selected = {true}`
2. 在 `_pages/about.md` 头部设置 `selected_papers: true`

### 支持的字段

| 字段 | 效果 |
|---|---|
| `abbr` | 左侧徽章（如期刊缩写） |
| `pdf` | PDF 下载按钮 |
| `html` | 论文链接按钮 |
| `code` | 代码链接按钮 |
| `abstract` | 展开/收起摘要 |
| `preview` | 论文封面缩略图（放到 `assets/img/publication_preview/`） |
| `award` | 显示获奖信息（如 Best Paper） |
| `selected = {true}` | 加入首页精选 |
| `bibtex_show = {true}` | 显示 BibTeX 复制按钮 |

---

## 7. 博客文章

文件命名规则：`_posts/YYYY-MM-DD-slug.md`

### 文章头部

```yaml
---
layout: post
title: 文章标题
date: 2025-05-28 12:00
tags: [math, thoughts]      # 标签（可多个）
published: true             # false 则不显示
related_publications: true  # 文末自动列出引用的论文
---
```

### 正文语法

**Markdown 标准语法**（标题、加粗、列表、代码块等）均支持。

**LaTeX 公式**：
```
行内：$E = mc^2$

独立：
$$
\nabla \cdot \mathbf{E} = \frac{\rho}{\varepsilon_0}
$$
```

**引用论文**（需要 `related_publications: true`）：
```
如文献 {% cite einstein1950meaning %} 所示...
```
引用的 key 对应 `papers.bib` 里的条目 key。

**注意**：现有的 3 篇文章都是 `published: false`，改成 `true` 才会出现在博客页面。

---

## 8. 项目页面

文件：`_projects/` 目录，每个项目一个 `.md` 文件。

### 头部

```yaml
---
layout: page
title: 项目名称
description: 一句话描述
img: assets/img/封面图.jpg   # 项目卡片背景图
importance: 1               # 排序（数字越小越靠前）
category: work              # 分类（work / fun）
---
```

### 正文插入图片

```html
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/1.jpg" title="说明文字" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/2.jpg" title="说明文字" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">图片说明文字</div>
```

列宽可以组合：两列（`col-sm-8` + `col-sm-4`）、三列（三个 `col-sm`）、全宽（`col-12`）。

---

## 9. 图片与资源

| 文件位置 | 用途 |
|---|---|
| `assets/img/prof_pic.jpg` | 首页头像 |
| `assets/img/publication_preview/` | 论文缩略图 |
| `assets/img/*.jpg` | 项目页面、博客插图 |
| `assets/pdf/` | 论文 PDF 文件 |

图片格式推荐 JPG 或 PNG，头像建议正方形，尺寸 400×400px 以上。

---

## 10. 本地预览

需要安装 [Docker](https://docs.docker.com/get-docker/)。

```bash
# 进入项目目录
cd /path/to/Sr-11.github.io

# 启动本地服务器（首次会下载镜像，约 400MB）
docker compose up

# 打开浏览器访问
open http://localhost:8080
```

修改文件后页面会自动刷新，不需要重启服务器。

退出：`Ctrl + C`

轻量版镜像（体积更小）：
```bash
docker compose -f docker-compose-slim.yml up
```

---

## 11. 部署

每次修改完内容后：

```bash
git add -A
git commit -m "简短描述：改了什么"
git push
```

GitHub Actions 会自动构建，约 4 分钟后 `https://sr-11.github.io` 更新。

可以在 GitHub 仓库的 **Actions** 标签页查看构建进度。

---

## 12. 待办清单

- [ ] 换头像：替换 `assets/img/prof_pic.jpg`
- [ ] 补充社交链接：`_config.yml` 里的 `github_username`、`x_username` 等
- [ ] 更新 CV：`_data/cv.yml`（目前是 Einstein 占位数据）
- [ ] 发布博客文章：把 `_posts/` 里的文章改为 `published: true`
- [ ] 添加论文：`_bibliography/papers.bib`（有发表物的话）
- [ ] 首页精选论文：在 `about.md` 里设 `selected_papers: true` 并在 bib 文件标记 `selected={true}`
