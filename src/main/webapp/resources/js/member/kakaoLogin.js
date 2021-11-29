Kakao.init('56c76e35398250abedfccf8bf8f759ec');
function kakaoLogin() {
    Kakao.Auth.login({
             scope : 'account_email',
             success : function(authobj) {
              console.dir(authobj);
              Kakao.API.request({
                url : '/v2/user/me',
                success: res =>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
										
             },
          })
 		}
 	})
 }