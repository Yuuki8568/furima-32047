// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

function count (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value;
    const charNum = document.getElementById("add-tax-price");
    charNum.innerHTML = `${countVal}` / 10;
    const charProfit  = document.getElementById("profit");
    charProfit.innerHTML = `${countVal}` - charNum.innerHTML;
  });
}

window.addEventListener('load', count);