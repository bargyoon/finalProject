(() => {
    let eqClicks = document.querySelectorAll(".eq-click");

})();

let openEnquiry = (num) => {
      let contextId = "eq-click-"+num;
      let answerId = "eq-answer-"+num;
       document.getElementById(contextId).style.display == "none" 
           ? document.getElementById(contextId).style.display = "table-row" : document.getElementById(contextId).style.display = "none";
       document.getElementById(answerId).style.display == "none" 
           ? document.getElementById(answerId).style.display = "table-row" : document.getElementById(answerId).style.display = "none";

}