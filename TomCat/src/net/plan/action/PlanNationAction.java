package net.plan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanCityBean;
import net.plan.db.PlanDAO;

/* 국가페이지(planNation.jsp) 이동전 처리 */
public class PlanNationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PlanNationAction execute()");
		request.setCharacterEncoding("UTF-8");

		// 파라미터 값 가져오기.
		String nation = request.getParameter("nation");	// 검색한 값, 리스트의 링크 값

		//객체 생성
		PlanDAO pdao = new PlanDAO();
		
		/* 게시글 가져오기 */
		//DB에 등록된 글의 개수.
		int count = pdao.getCityCount(nation);
		
		// 한페이지에 보여줄 글의 개수
		int pageSize = 5;

		// 현페이지가 몇페이지인지 가져오기(기본 1페이지)
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1"; // pageNum없으면 무조건 1페이지
		int currentPage = Integer.parseInt(pageNum);
		
		// 시작글 구하기 1 11 21 31 ... <= pageNum, pageSize 조합
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행구하기
		int endRow = currentPage * pageSize;

		// 도시 리스트 가져오기
		List<PlanCityBean> pcbList = null;
		if(count>0) {
			pcbList = pdao.getCityList(nation, startRow, pageSize);
		}
		request.setAttribute("pcbList", pcbList);	// 리스트 담기
		
		// 게시글 출력에 필요한 파라미터
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);

		/* 페이징 */
		// 필요한 전체 페이지 수
		int pageCount = count/pageSize + (count%pageSize==0 ? 0:1);
		// 한페이지에 출력할 페이지 수
		int pageBlock = 5;
		// 시작 페이지
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;;
		// 끝 페이지
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// 페이징에 필요한 값들 담기
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./plan/planNation.jsp?pageNum="+pageNum);
		forward.setRedirect(false);

		return forward;
	}
}