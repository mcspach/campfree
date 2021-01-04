import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById('banner-typed-text')) {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to DirtBag Map...", "Find your perfect camping getaway...", "Share info about free public land...", "Host campers on your private land..."],
    typeSpeed: 24,
    backDelay: 3000,
    loop: true
  });}
}

export { loadDynamicBannerText };
