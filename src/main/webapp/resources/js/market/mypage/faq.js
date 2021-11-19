(() => {
    let faqAnswers = document.querySelectorAll(".faq-answer");
    for (let index = 0; index < faqAnswers.length; index++) {
        faqAnswers[index].style.display = "none";
    }
})();

let openFaq = (num) => {
    let faqAnswer = document.querySelectorAll("#faq-answer-" + num);
    for (let index = 0; index < faqAnswer.length; index++) {
        faqAnswer[index].style.display == "none" ? faqAnswer[index].style.display = "table-row" : faqAnswer[index].style.display = "none";
    }

}