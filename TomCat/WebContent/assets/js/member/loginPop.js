
/* 로그인 팝업 */
function popupToggle() {
	
	$(document).ready(function(){
		// 팝업 띄움
		if($('#loginPopContainer').css('display')=="none") {
			
			// 현재 페이지 정보, 회원가입 페이지에서 로그인 링크 누르면 공개키가 또 생성되서 오류 발생하기 때문에 현재페이지 정보 얻어와서 처리
			var pageLocation = window.location.pathname;
			// 회원가입 페이지에서 로그인 팝업을 띄운경우 공개키, 개인키가 새로 생성되지 않게 하기
			if(pageLocation!="/TomCat/MemberJoin.me") {
				// 공개키 가져오기(RSA암호화 준비)
				$.ajax('./member/loginPop.jsp', {
					success: function(data){
						$('#login_form').append(data);
					}
				});
			}
			
			$('#id_login').val('');	// 폼에 있는 값 지우기
			$('#pass_login').val('');	// 폼에 있는 값 지우기
			
			$('#loginPopContainer').css('display', 'block');
			$('#loginPop').css('display', 'block');
			
		}else {	// 팝업 숨김
			$('#loginPopContainer').css('display', 'none');
			$('#loginPop').css('display', 'none');
			
			// 공개키 hidden태그 지우기
			$('#rsaPublicKeyModulusLogin').remove();
			$('#rsaPublicKeyExponentLogin').remove();
		}
	});
	
}

/* 로그인 인증 */
function validateEncryptedLoginForm() {

	var id = document.login_form.id_login.value;
	var pass = document.login_form.pass_login.value;
	
	if(id=="" || pass==""){
		alert("아이디/비밀번호를 입력해주세요.");
		return false;
	}
	
	// 공개키 가져오기
    var rsaPublicKeyModulusLogin = document.getElementById("rsaPublicKeyModulusLogin").value;
    var rsaPublicKeyExponentLogin = document.getElementById("rsaPublicKeyExponentLogin").value;
    
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulusLogin, rsaPublicKeyExponentLogin);
    
    // 사용자ID와 비밀번호를 RSA로 암호화한다.(이름은 암호화 제외)
    var securedId = rsa.encrypt(id);
    var securedPass = rsa.encrypt(pass);
    
    // 암호화된 값을 다시 폼에 넣는다.
    document.login_form.id_login.value = securedId;
    document.login_form.pass_login.value = securedPass;
    
    return true;
}

/* 아이디 찾기 팝업 브라우져 */
function idFinderPopup() {
	
	window.open('./MemberIdFinder.me',  '_blank', 
			'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, directories=no, width=600, height=350, top=200, left=400');

}

/* 비밀번호 찾기 팝업 브라우져 */
function passFinderPopup() {

	window.open('./MemberPassFinder.me',  '_blank', 
	'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, directories=no, width=600, height=350, top=200, left=400');
	
}








