function CountryList(){ /*국가리스트 출력*/
	country = new Array("아시아", "유럽", "남태평양", "북미", "중남미");
	var i=0;
	$(document).ready(function(){
		$.getJSON('./plan/countryData.jsp', function(data){
			$.each(data, function(index,item){
				for(i=1;i<=5;i++){
				if(item.continent==i){
					$('.'+country[i-1]).append( function(){
						var con = '<div><a href=./PlanSearch.pl?check=1&search='+'"'+item.country+'"'+'>'+item.country+'</a><span>'+item.EnName+'</span></div>';
						return con;
					}); 	
				}//if
				}//for
			});
		});
	});
}

function checkSearch(){ /*검색 폼제어*/
	if(document.fr.check.value==0){
		alert("도시명/국가명을 선택해 주세요");
		document.fr.check.focus();
		return false;
	}
	if(document.fr.search.value==""){
		alert("검색어를 작성해주세요");
		document.fr.search.focus();
		return false;
	}
	
}

