document.addEventListener("DOMContentLoaded", () => {
  const memo_table = document.querySelector("table.hs_container");

  memo_table?.addEventListener("click", (e) => {
    const td = e.target;
    if (td.tagName === "TD") {
      const tr = td.closest("TR");
      const seq = tr.dataset.seq;
      if (seq) {
        document.location.href = `${rootPath}/write/${seq}/m-detail`;
      }
    }
  }); //end memo_table
});
