(() => {
    let accState = document.querySelectorAll(".acc-state");
    let accAmount = document.querySelectorAll(".acc-amount");
    for (let i = 0; i < accState.length; i++) {
        if(accState[i].innerHTML == "사용"){
            accState[i].style.color = "red";
            accAmount[i].style.color = "red";
        } else {
            accState[i].style.color = "steelblue";
            accAmount[i].style.color = "steelblue";
        }
    }
})()