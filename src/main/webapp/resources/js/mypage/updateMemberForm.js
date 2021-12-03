/**
 * 
 */
(()=>{
	let confirmNickName = "";
	
	document.querySelector("#btnNickNameCheck").addEventListener('click', ()=>{
		let nickName = document.querySelector("#nickName").value;

		if(nickName == ''){
			document.querySelector("#nickNameCheck").innerHTML = "닉네임을 입력하세요.";
			document.querySelector("#nickName").focus();
		}
		
		fetch("/mypage/nickNameCheck?nickName=" + nickName)
		.then(response => {
			if(response.ok){
				return response.text();
			}else{
				throw new Error(response.status);
			}
			
		}).then(text => {
			if(text == "0"){
				document.querySelector("#nickNameCheck").innerHTML = "사용 가능한 닉네임입니다.";
				confirmNickName = nickName;
			}else{
				document.querySelector("#nickNameCheck").innerHTML = "이미 존재하는 닉네임입니다.";
			}
		}).catch(error => {
			document.querySelector("#nickNameCheck").innerHTML = "응답에 실패했습니다. 상태코드 : " + error;
		})
	});
	
	document.querySelector("#frmUpdateMember").addEventListener("submit", e =>{
		let nickName = document.querySelector("#nickName").value;
		let password = document.querySelector("#password").value;
		let password2 = document.querySelector("#password2").value;
		let address = document.querySelector("#address").value;
		let addressDetail = document.querySelector("#addressDetail").value;
		
		if(nickName == '' && password == '' && password2 == '' && address == '' && addressDetail == ''){
			alert("변경할 정보가 없습니다.");
			e.preventDefault();
			return;
		}
		
		if(address == '' && addressDetail != ''){
			alert("주소를 입력하세요.");
			e.preventDefault();
			return;
		}
		
		if(password == '' && password2 != ''){
			alert("비밀번호를 확인하세요.");
			e.preventDefault();
			return;
		}
		
		if(nickName != '' && nickName != confirmNickName){
			e.preventDefault(); // 이벤트 전파 차단
			document.querySelector("#nickNameCheck").innerHTML = "닉네임 중복 검사를 하지 않았습니다.";
			document.querySelector("#nickName").focus();
		};
	})
	
})();