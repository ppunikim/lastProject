document.addEventListener("DOMContentLoaded", () => {
  const username = document.querySelector("#username");
  const password = document.querySelector("#password");
  const button = document.querySelector("#btn_join");

  const error_divs = document.querySelector("div.error");

  username?.focus();

  const error_msg = (div, message) => {
    div.innerText = message;
  };
  const username_div = error_divs[div_index.username];

  username?.addEventListener("blur", (e) => {
    const current = e.currentTarget;
    if (current.value === "") {
      const msg = "사용할 아이디를 입력하세요.";
      error_msg(username_div, msg);

      current.focus();
      return false;
    }
  });

  password?.addEventListener("input", (e) => {
    const current = e.currentTarget;
    if (current.value === "") {
      const msg = "사용할 비밀번호를 입력하세요.";
      error_msg(password, msg);

      current.focus();
      return false;
    }
  });
});
