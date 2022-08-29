function setThumbnail(event) {
  for (var image of event.target.files) {
    var reader = new FileReader();

    reader.onload = function (event) {
      let img = document.querySelector("img.img-img");
      if (img) {
        img.setAttribute("src", event.target.result);
      } else {
        img = document.createElement("img");
        img.classList.add("img-img");
        img.setAttribute("src", event.target.result);
      }
      document.querySelector("div.img-box").appendChild(img);
    };
    reader.readAsDataURL(image);
  }
}
