const addQuote = () => {
  const results = document.querySelector(".quote");
  if (results) {
    fetch("https://type.fit/api/quotes")
    .then(response => response.json())
    .then((data) => {
      const quoteToEnter = `
        <p>${data[Math.floor(Math.random() * data.length )].text}</p>
      `;
      results.insertAdjacentHTML("beforeend", quoteToEnter);
    });
  }
};
export {addQuote};