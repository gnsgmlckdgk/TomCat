
/* 로그인 팝업 */
function popupToggle() {
	
	$(document).ready(function(){
		// 팝업 띄움
		if($('#loginPopContainer').css('display')=="none") {
			
			// 공개키 가져오기(RSA암호화 준비)
			$.ajax('./member/loginPop.jsp', {
				success: function(data){
					$('#login_form').append(data);
				}
			});
			
			$('#loginPopContainer').css('display', 'block');
			$('#loginPop').css('display', 'block');
		}else {	// 팝업 숨김
			$('#loginPopContainer').css('display', 'none');
			$('#loginPop').css('display', 'none');
		}
	});
	
}

/* 로그인 인증 */
function validateEncryptedLoginForm() {

	var id = document.fr.id.value;
	var pass = document.fr.pass.value;
	
	if(id=="" || pass==""){
		alert("아이디/비밀번호를 입력해주세요.");
		return false;
	}
	
	// 공개키 가져오기
    var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
    var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
    
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
    
    // 사용자ID와 비밀번호를 RSA로 암호화한다.(이름은 암호화 제외)
    var securedId = rsa.encrypt(id);
    var securedPass = rsa.encrypt(pass);
    
    // 암호화된 값을 다시 폼에 넣는다.
    document.fr.id.value = securedId;
    document.fr.pass.value = securedPass;
    
    return true;
}
