function memo(event) {
  const hs_result = document.querySelector("div.hs_result");

  fetch(`${rootPath}/write/m-list`)
    .then((res) => res.text())
    .then((result) => {
      hs_result.innerHTML = "";
      hs_result.style.display = "block";
      hs_result.innerHTML = result;
    });
}
function diary(event) {
  const hs_result = document.querySelector("div.hs_result");

  fetch(`${rootPath}/write/d-list`)
    .then((res) => res.text())
    .then((result) => {
      hs_result.innerHTML = "";
      hs_result.style.display = "block";
      hs_result.innerHTML = result;
    });
}
function book(event) {
  const hs_result = document.querySelector("div.hs_result");

  fetch(`${rootPath}/write/b-list`)
    .then((res) => res.text())
    .then((result) => {
      hs_result.innerHTML = "";
      hs_result.style.display = "block";
      hs_result.innerHTML = result;
    });
}

function api_detail(event) {
  const api_result = document.querySelector("div.book_news_detail");

  fetch(`${rootPath}/write/${title}/api_detail`)
    .then((res) => res.text())
    .then((result) => {
      api_result.innerHTML = "";
      api_result.style.display = "block";
      api_result.innerHTML = result;
    });
}
