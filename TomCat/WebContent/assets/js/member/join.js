
// RSA암호화
function validateEncryptedForm() {
    var id = document.fr.id.value;
    var email_check = document.fr.email_check.value;	// 인증번호
    var pass = document.fr.pass.value;
    var pass2 = document.fr.pass2.value;
    var name = document.fr.name.value;
    var nick = document.fr.nick.value;
    var gender = document.fr.pregender.value;
    var tel = document.fr.tel.value;
    
    // 제약조건(수정중)
    	// 입력여부, 비밀번호 일치여부
    if (!id) {
    	alert("아이디를 입력해주세요.");
    	document.fr.id.focus();
    	return false;
    }else if(!pass) {
    	alert("비밀번호를 입력해주세요.");
    	document.fr.pass.focus();
    	return false;
    }else if(pass != pass2) {
    	alert("비밀번호가 일치하지 않습니다.");
    	document.fr.pass2.focus();
    	return false;
    }else if(!name) {
    	alert("이름을 입력해주세요.");
    	document.fr.name.focus();
    	return false;
    }else if(!nick) {
    	alert("닉네임을 입력해주세요.")
    	document.fr.nick.focus();
    	return false;
    }else if(!tel) {
    	alert("연락처를 입력해주세요.");
    	document.fr.tel.focus();
    	return false;
    }
    	// 정규표현식
    	var regPass = /^[a-z][a-z|0-9|!@#$%^&*_-]{5,15}/i;	// 영문시작, 영문숫자특수문자 조합 가능
    	var regNick = /^[a-z|가-힣][a-z|0-9|가-힣]{1,8}/i;
    	var regTel = /^[0-9]{7,20}/;	// 숫자만 가능
    	if(!regPass.test(pass)) {
    		alert("비밀번호를 형식에 맞게 입력해주세요.");
    		return false;
    	}else if(!regNick.test(nick)) {
    		alert("닉네임을 형식에 맞게 입력해주세요.");
    		return false;
    	}else if(!regTel.test(tel)) {
    		alert("연락처를 형식에 맞게 입력해주세요.");
    		return false;
    	}
    	
    try {
    	// 공개키 가져오기
        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        
        var rsa = new RSAKey();
        rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
        
        // 사용자ID와 비밀번호를 RSA로 암호화한다.(이름은 암호화 제외)
        var securedId = rsa.encrypt(id);
        var securedPass = rsa.encrypt(pass);
        var securedPass2 = rsa.encrypt(pass2);
        var securedNick = rsa.encrypt(nick);
        var securedGender = rsa.encrypt(gender);
        var securedTel = rsa.encrypt(tel);
        
        // 암호화된 값들을 다시 폼에 덮어쓴다.
        document.fr.id.value = securedId;
        document.fr.pass.value = securedPass;
        document.fr.pass2.value = securedPass2;
        document.fr.nick.value = securedNick;
        document.fr.gender.value = securedGender;
        document.fr.tel.value = securedTel;
        
        return true;
        
    } catch(err) {
        alert(err);
    }
}
