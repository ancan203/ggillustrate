# ggillustrate

**ggillustrate** is an R package that transforms your `ggplot2` charts into metaphor-rich illustrations. It aims to make data communication more expressive, engaging, and emotionally resonant — without losing the essence of the data.

Currently, `ggillustrate` supports converting standard plots into **sketches using edge detection**, with future support planned for **AI-based metaphor generation**.

---

## 🌟 Project Motivation

Traditional statistical graphics are powerful but can feel impersonal or abstract. `ggillustrate` explores the intersection of **data visualization** and **visual storytelling** by transforming plots into artistic metaphors (e.g., turning a bar chart into a series of "rockets" or a growth line into a "mountain path").

This is especially helpful for:

* Educators and researchers creating impactful presentations
* Designers working with data-rich infographics
* Anyone looking to bridge the gap between **information** and **emotion**

---

## 🚀 Current Features

✅ **Convert `ggplot2` charts into edge-detected sketches** using the `{magick}` package
🕸️ Future support for **AI-generated illustrations via ControlNet**

### Example

```r
library(ggplot2)
library(ggillustrate)

p <- ggplot(mtcars, aes(mpg, hp)) + geom_point()
illustrate_edges(p)
```

This will:

1. Save your plot as an image
2. Apply edge detection to create a sketch-like version
3. Open the resulting image in your browser

---

## 🛠️ Tech Stack

* R: `ggplot2`, `magick`, `usethis`, `devtools`
* (Planned) Python integration: `OpenCV`, `Replicate API`, `reticulate`
* (Planned) AI models: ControlNet for sketch-to-metaphor transformation

---

## 🧽 Roadmap

* [x] Create R package scaffold
* [x] Implement edge detection using `{magick}` in R
* [ ] Add custom metaphor prompt support
* [ ] Integrate ControlNet via Replicate API
* [ ] Build `illustrate_plot()` as a full wrapper
* [ ] Add toggle and overlay options to preserve data transparency
* [ ] Write vignettes and deploy `pkgdown` documentation site

---

## 👨‍💻 Team

* Can Ha An
* Pham Minh Hieu
* Nguyễn Tuấn Hiệp

---

## 🔗 Repository

All code and documentation will be maintained at:
👉 [https://github.com/ancan203/ggillustrate](https://github.com/ancan203/ggillustrate)
