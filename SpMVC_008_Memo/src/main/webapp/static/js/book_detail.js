document.addEventListener("DOMContentLoaded", () => {
  const book_table = document.querySelector("table.books");
  book_table?.addEventListener("click", (e) => {
    /*table 에 click event를 적용하면
      가장 안쪽의 td가 target으로 작동한다.
      그래서 가장 안쪽의 td를 누르면 
      td를 감싸는 tr을 가져와라는 이야기이다.
    */
    const target = e.target;
    const tr = target?.closest("TR");
    const seq = tr?.dataset.seq;

    /* JS에서 변수값이
       0, undefined, null, NaN, "" 등은 if에서 모두 false로 인식한다.
       seq값이 정상적인 범위일 때만 detail로 점프하기.
    */
    if (seq) {
      document.location.href = `${rootPath}/book/${seq}/b-detail`;
    }
  });
});
