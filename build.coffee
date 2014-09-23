#!/usr/bin/env coffee

lazz = require "lazz"
moment = require "moment"

lazz.config
  source: "./site/"
  destination: "./build/"
  layout: "./site/layouts/"
.global
  title: "Lazz Bootstrap"
  site: "http://lazz.bicrement.com/"
  github: "https://github.com/zhuochun/lazz-bootstrap"
  author: "Wang Zhuochun"
.global "data/*.json"
.content "posts", "posts/*", layout: "post"
.process ({ file }, done) ->
  file.posts.sort (a, b) -> b.date - a.date
  done()
.content "pages", "pages/*", layout: "page"
.process ({ file }, done) ->
  file.pages.forEach (page) ->
    title = page.title.trim()
                      .toLowerCase()
                      .replace(/[^-\w\s]|_/g, "")
                      .replace(/\s+/g,"-")
    page.path = "#{title}/index.html"
  done()
.asset "assets/*"
.rest "*.jade"
.helper "path", (path) -> "/#{path.replace('/index.html', '/')}"
.helper "displayDate", (date) -> moment(date).format("MMMM Do YYYY")
.helper "hasPrev", (idx) -> idx > 0
.helper "hasNext", (idx) -> idx < this.file.posts.length - 1
.thatsAll()
