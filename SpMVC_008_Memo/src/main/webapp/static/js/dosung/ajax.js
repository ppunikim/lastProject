console.log("로딩완료")
function dosungPower(event) {
  const title = event.target.getAttribute('title');
  const result_box = document.querySelector("div.d-content")
 
  console.log(title);
  fetch(`${rootPath}/dosung/${title}/result`)
  .then((res) => res.text())
  .then((result) => {
    result_box.innerHTML = "";
	  result_box.style.display = "block";
	  result_box.innerHTML = result;
  });
}