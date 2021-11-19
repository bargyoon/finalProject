(() => {
    const prdOptionDivs = document.querySelectorAll(".selected-prd");
    for (let i = 0; i < prdOptionDivs.length; i++) {
        prdOptionDivs[i].style.display = "none";
    }

    let eqClick = document.querySelectorAll(".eq-click");
    for (let index = 0; index < eqClick.length; index++) {
        eqClick[index].style.display = "none";
    }
})();

let focusReview = () => {
    document.getElementById("focus-r").focus({preventScroll:false});
}

let focusQnA = () => {
    document.getElementById("focus-q").focus({preventScroll:false});
}

let addOption = (optionValue) => {
    if(optionValue != "" && checkOptionExists(optionValue)){

        addTotalPrice("+", 65000);

        let baseDiv = document.querySelector(".option-form");
        let div = document.createElement("div");
        div.classList.add("prd-option", "p-3", "mt-3", "selected-prd");
        div.id = optionValue;
        
        let div2 = document.createElement("div");
        div2.classList.add("d-flex", "justify-content-between");
        let pTag = document.createElement("p");
        let pTag2 = document.createElement("p");
        pTag.innerText = optionValue;
        pTag2.innerHTML = "<i class='fas fa-times'></i>";

        pTag2.addEventListener("click", ()=>{
            minusTotalPrice(input.defaultValue, 65000);
            document.getElementById(optionValue).remove();
        })
        
        let div3 = document.createElement("div");
        div3.classList.add("d-flex", "justify-content-between");

        let div4 = document.createElement("div");
        div4.classList.add("prd-amount");

        let btnPlus = document.createElement("button");
        let btnMinus = document.createElement("button");
        let input = document.createElement("input");
        input.defaultValue = 1;
        input.name = optionValue + "-cnt";
        input.type = "text";
        input.readOnly = "readonly";
        btnPlus.innerText = "+1";
        btnMinus.innerText = "-1";

        let spanTag = document.createElement("span");
        spanTag.innerText = "65,000 원";
        spanTag.id = optionValue + "-price";

        btnPlus.addEventListener("click", (e) => {
            input.defaultValue++;
            calPrice(optionValue, input.defaultValue);
            addTotalPrice("+", 65000)
        })
        btnMinus.addEventListener("click", (e) => {
            if(input.defaultValue > 1){
                input.defaultValue--;
                calPrice(optionValue, input.defaultValue);
                addTotalPrice("-", 65000)
            }
        })

        div4.appendChild(btnPlus);
        div4.appendChild(input);
        div4.appendChild(btnMinus);

        div3.appendChild(div4);
        div3.appendChild(spanTag);
        
        div2.appendChild(pTag);
        div2.appendChild(pTag2);
        div.appendChild(div2);
        div.appendChild(div3);
        baseDiv.appendChild(div);
    }
}

let calPrice = (option, prdCnt) => {
    let prdPerPrice = 65000;
    let prdPrice = prdCnt * prdPerPrice;
    let prdPriceStr = prdPrice.toLocaleString();
    document.getElementById(option+"-price").innerText = prdPriceStr + " 원";
}

let checkOptionExists = (optionValue) => {
    if(document.getElementById(optionValue) != null){
        alert("이미 선택한 옵션입니다.");
        return false;
    }
    return true;
}

let addTotalPrice = (method, price) => {
    let hiddenPrice = Number(document.getElementById("total-price-hidden").value);
    let totalPrice = document.getElementById("prd-total-price");
    let revisePrice = "";

    if(method == "+"){
        document.getElementById("total-price-hidden").value = hiddenPrice + price;
        revisePrice = Number(document.getElementById("total-price-hidden").value).toLocaleString();
        totalPrice.value = revisePrice + " 원";
    } else {
        document.getElementById("total-price-hidden").value = hiddenPrice - price;
        revisePrice = Number(document.getElementById("total-price-hidden").value).toLocaleString();
        totalPrice.value = revisePrice + " 원";
    }
}


let minusTotalPrice = (prdCnt, price) => {
    let minusPrice = prdCnt * price;
    addTotalPrice("-", minusPrice);
}



let changeImgSize = (imgDiv) => {
    let img = document.createElement("img");
    img.src = imgDiv.firstElementChild.src;
    if(document.querySelector(".extend-img-area").hasChildNodes){
        document.querySelector(".extend-img-area").removeChild(document.querySelector(".extend-img-area").firstChild);
    }
    document.querySelector(".extend-img-area").append(img);
}

let openEnquiry = (tr) => {
    let contextId = tr.id + "-context";
    let answerId = tr.id + "-answer";
    document.getElementById(contextId).style.display == "none" 
        ? document.getElementById(contextId).style.display = "table-row" : document.getElementById(contextId).style.display = "none";
    document.getElementById(answerId).style.display == "none" 
        ? document.getElementById(answerId).style.display = "table-row" : document.getElementById(answerId).style.display = "none";
}