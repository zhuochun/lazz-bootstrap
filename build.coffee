#!/usr/bin/env coffee

lazz = require "lazz"

lazz.config
  source: "./site/"
  destination: "./build/"
  layout: "./site/layouts/"
.global
  title: "Lazz Bootstrap Blog"
  site: "http://www.bicrement.com/lazz-bootstrap"
  github: "https://github.com/zhuochun/lazz"
  author: "Wang Zhuochun"
.global "data/*.json"
.content "posts", "posts/*", layout: "post"
.content "pages", "pages/*", layout: "page"
.asset "assets/*"
.rest "*.jade"
.filter
  hasPrev: (idx) -> idx > 0
  hasNext: (idx) -> idx < this.file.posts.length - 1
.thatsAll()
