# ggillustrate

**ggillustrate** is an R package that transforms your `ggplot2` charts into AI-generated illustrations. By converting standard plots into metaphor-rich visuals (like coins, rockets, or mountains), we aim to make data communication more expressive, engaging, and accessible — especially for educators, content marketers, and visual storytellers.

## 🌟 Project Motivation

Traditional data visualizations are powerful but often fall short in capturing emotional or metaphorical depth. `ggillustrate` bridges the gap between statistical graphics and visual storytelling using:

- Sketch generation via edge detection (OpenCV)
- AI-based sketch-to-image translation (e.g., ControlNet via Replicate API)
- Seamless integration with the R ecosystem

This project is a creative proof-of-concept showing how AI and data visualization can co-evolve in modern communication tools.

## 🚀 Features

- 🖼️ Convert `ggplot2` charts into stylized sketches  
- ✨ Generate metaphorical images with ControlNet (or similar models)  
- 🔗 Integrate R + Python via `reticulate`  
- 📦 Easy-to-use `illustrate_plot()` wrapper  
- 📚 Comes with a documentation site and usage vignettes  

## 🛠️ Tech Stack

- R (`ggplot2`, `usethis`, `pkgdown`)  
- Python (`OpenCV`, `Replicate API`)  
- `reticulate` for R-Python integration  
- Sketch-to-image models (e.g., ControlNet)

## 📋 Development Plan

- [x] Finalize project scope and set up R package scaffold  
- [x] Prepare sample `ggplot2` charts  
- [x] Implement sketch conversion using Python (OpenCV)  
- [ ] Integrate Python backend into R via `reticulate`  
- [ ] Implement Replicate API call to send sketch and prompt  
- [ ] Develop `illustrate_plot()` wrapper function in R  
- [ ] Write vignettes and build documentation site using `pkgdown`  
- [ ] Polish visuals, finalize usage guide, and prepare demo poster  

## 👨‍💻 Team

- Can Ha An  
- Pham Minh Hieu  
- Nguyen Tuan Hiep  

## 🔗 Repository

All code and documentation will be maintained at:  
[https://github.com/ancan203/ggillustrate](https://github.com/ancan203/ggillustrate)

