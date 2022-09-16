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
