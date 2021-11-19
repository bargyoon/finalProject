let checkHeight = () => {
    if(window.scrollY < 30){
        document.querySelector(".banner-area").style.display = "flex";
    } else {
        document.querySelector(".banner-area").style.display = "none";
    }
}