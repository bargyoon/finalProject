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

let tabBtns = document.querySelector('.faq-nav').children;
	for (var i = 0; i < tabBtns.length; i++) {
		let tabBtn = tabBtns[i].children[0];
		
		if(tabBtn.href==document.location.href){
			tabBtn.classList.add('selected');
		}else{
			tabBtn.classList.remove('selected');
		}
	}