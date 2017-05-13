package net.plan.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WikiScraping implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터 값 가져오기
		String nation = request.getParameter("nation");	// 국가페이지
		String region = null;
		if(nation==null) {
			region = request.getParameter("region");	// 지역페이지
		}
		
		// html 가져오기
		Document doc;
		if(region==null) {
			doc = Jsoup.connect("https://ko.wikipedia.org/wiki/"+nation).get();
		}else {
			doc = Jsoup.connect("https://ko.wikipedia.org/wiki/"+region).get();
		}
		
				
		// 위키백과 에서 특정 부분 가져옴
		// mergedrow의 th부분이랑 td부분 따로 들고올 예정
		
		Elements p = doc.select(".vcard tbody .mergedrow");
		//Element e = p.first();	// 첫번째 한번만 들고옴
		List<String> listWiki = new ArrayList<String>();
		for(Element e : p) {
			listWiki.add(e.text());
			System.out.println("text: " + e.text());
		}
		
		// request에 담기
		request.setAttribute("wiki", listWiki);
		
		// 이동정보
		ActionForward forward = new ActionForward();
		// 이동정보는 controller에 따라 바뀌기 때문에 여기서 값을 초기화 하지 않음, controller에서 따로 초기화
		return forward;
	}
}
