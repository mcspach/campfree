const addQuote = () => {
  const results = document.querySelector(".quote");
  if (results) {
    fetch("https://type.fit/api/quotes")
    .then(response => response.json())
    .then((data) => {
      const arrIndex = Math.floor(Math.random() * data.length) ;
      const quoteToEnter = `
        <h2>${data[arrIndex].text} </h2>
        <p> - ${data[arrIndex].author}</p>
      `;
      results.insertAdjacentHTML("beforeend", quoteToEnter);
    });
  }
};
export {addQuote};