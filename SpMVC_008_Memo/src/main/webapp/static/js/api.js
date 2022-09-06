document.addEventListener("DOMContentLoaded", () => {
  const detail = document.querySelector("table.hs_detail");
  const ranDetail = document.querySelectorAll("img.img");
  detail?.addEventListener("click", (e) => {
    const target = e.target;
    const tr = target?.closest("TR");
    const seq = tr?.dataset.seq;
    const seqplace = tr?.dataset.seqplace;
    const myseq = tr?.dataset.myseq;

    if (seq) {
      document.location.href = `${rootPath}/api/${seq}/api-detail`;
    } else if (seqplace) {
      document.location.href = `${rootPath}/api/${seqplace}/place-detail`;
    } else if (myseq) {
      document.location.href = `${rootPath}/api/${myseq}/my-update`;
    }
  });

  // 랜덤 이미지 값 눌렀을 때 detail 보기 구현 안됨.
  ranDetail?.addEventListener("click", (e) => {
    const target = e.target;
    const div = target?.closest("DIV");
    const seq = div?.dataset.seq;
    document.location.href = `${rootPath}/api/${seq}/api-detail`;
  });
});
