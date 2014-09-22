#!/usr/bin/env coffee

lazz = require "lazz"
moment = require "moment"

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
.transform (data, done) ->
  data.file.posts.sort (a, b) ->
    moment(b.date) - moment(a.date)
  done()
.content "pages", "pages/*", layout: "page"
.asset "assets/*"
.rest "*.jade"
.filter
  formatDate: (date) -> moment(date).format("MMMM Do YYYY")
  hasPrev: (idx) -> idx > 0
  hasNext: (idx) -> idx < this.file.posts.length - 1
.thatsAll()
