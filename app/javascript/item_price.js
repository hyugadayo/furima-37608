function taxPrice() {
  // 下記 価格入力欄の要素取得 //
  const itemPrice = document.getElementById('item-price');
  // 下記 文字入力のたびイベント発生 //
  itemPrice.addEventListener("input", () => {
    // 下記 入力された数字を取得 //
    const inputValue = itemPrice.value;
    // 下記 手数料欄の要素取得 //
    const addTaxPrice = document.getElementById("add-tax-price") 
    // 下記 手数料の計算およびフォームの書き換え //
    addTaxPrice.innerHTML =  Math.floor(inputValue * 0.1)
    // 下記 販売利益欄の要素取得 //
    const profit = document.getElementById("profit")
    // 下記 販売利益計算およびフォームの書き換え //
    profit.innerHTML = Math.floor(inputValue * 0.9)
  })
};

window.addEventListener('load', taxPrice)
