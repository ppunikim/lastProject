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

// 내가 쓸 독후감인, b-insert 보기
function writeBook(event) {
  //결과값이 들어갈 곳
  const write_result = document.querySelector("div.hs_blist_result");

  //들어가야 할 jsp
  fetch(`${rootPath}/write/b-insert`)
    .then((res) => res.text())
    .then((result) => {
      write_result.innerHTML = "";
      write_result.style.display = "block";
      write_result.innerHTML = result;
    });
}
//내가 쓴 독후감 update 하기
function updateBook(event) {
  const write_result = document.querySelector("div.hs_blist_result");

  fetch(`${rootPath}/write/${book.b_isbn}/b-detail`)
    .then((res) => res.text())
    .then((result) => {
      write_result.innerHTML = "";
      write_result.style.display = "block";
      write_result.innerHTML = result;
    });
}
