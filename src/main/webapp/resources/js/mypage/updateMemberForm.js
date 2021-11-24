/**
 * 
 */
(()=>{
	let confirmNickname = "";
	
	document.querySelector("#btnNicknameCheck").addEventListener('click', ()=>{
		let nickname = document.querySelector("#nickname").value;
		
		if(!nickname){
			document.querySelector("#nicknameCheck").innerHTML = "닉네임을 입력하세요.";
			return;
		}
		
		fetch("/mypage/nicknameCheck?nickname=" + nickname)
		.then(response => {
			if(response.ok){
				return response.text();
			}else{
				throw new Error(response.status);
			}
			
		}).then(text => {
			if(text == "available"){
				document.querySelector("#nicknameCheck").innerHTML = "사용 가능한 닉네임입니다.";
				confirmNickname = nickname;
			}else{
				document.querySelector("#nicknameCheck").innerHTML = "이미 존재하는 닉네임입니다.";
			}
		}).catch(error => {
			document.querySelector("#nicknameCheck").innerHTML = "응답에 실패했습니다. 상태코드 : " + error;
		})
	});
	
	document.querySelector("#frm_update").addEventListener("submit", e =>{
		let nickname = document.querySelector("#nickname").value;
		let password = document.querySelector("#password").value;
		let password2 = document.querySelector("#password2").value;
		let pwReg = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9])(?=.{8,})/;
		
		if(nickname != "" && confirmNickname != nickname){
			e.preventDefalut(); // 이벤트 전파 차단
			document.querySelector("#idCheck").innerHTML = "닉네임 중복 검사를 하지 않았습니다.";
			document.querySelector("#userId").focus();
		}
	})
	
})();