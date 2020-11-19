import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["When everything is booked out...", "Rent your perfect camping getaway with us."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
