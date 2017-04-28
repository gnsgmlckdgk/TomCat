
/* 회원정보 메뉴 팝업 */
function memberManagerPopup() {
	
	$(document).ready(function() {
		// 토글
		if($('#memberManagerNav').css('display')=='none') {
			$('#memberManagerNav').css('display', 'block');
		}else {
			$('#memberManagerNav').css('display', 'none');	
		}
		
		$('section').click(function(){
			$('#memberManagerNav').css('display', 'none');
		});
		
	});
}