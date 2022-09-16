function haetsalPower(event) {
  const hs_result = document.querySelector("div.hs_result");

  fetch(`${rootPath}/m_list.jsp`)
    .then((res) => res.text())
    .then((result) => {
      hs_result.innerHTML = "";
      hs_result.style.display = "block";
      hs_result.innerHTML = result;
    });
}
