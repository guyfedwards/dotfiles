// ==UserScript==
// @name        Reddit redirect old
// @namespace   Violentmonkey Scripts
// @icon
// @version     1.0.0
//
// @match       *://www.reddit.com/*
// @grant       none
//
// @author      -
// @description
// ==/UserScript==
let u = new URL(window.location)
if (u.hostname === "www.reddit.com") {
  u.hostname = "old.reddit.com";
  console.log('fuck')
}
window.location.replace(u.toString())
