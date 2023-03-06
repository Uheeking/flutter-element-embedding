// (function () {
//   window._stateSet = function () {
//     console.log("HELLO From Flutter!!");
//   };
// })();

function updateColor(e) {
  let bgColor = getComputedStyle(e.currentTarget).backgroundColor;
  let rgbList = bgColor
    .split("(")[1]
    .split(")")[0]
    .split(", ")
    .map((e) => parseInt(e));
  window.setThemeColor(rgbList);
}

let counter = document.querySelector("#counter");

window.setCounter = (count) => {
  counter.value = count;
};
