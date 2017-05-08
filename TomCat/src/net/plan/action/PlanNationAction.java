package net.plan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanDAO;

public class PlanNationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PlanNationAction execute()");
		request.setCharacterEncoding("UTF-8");

//		//지역값 받아오기.
//		String region = request.getParameter("region");
//		
//		//지역값 받아와서 글 갯수에 조건 걸어서, 지역에 맞는 글만 가져오는 과정 필요.
//		//타입값 받아와서 글 타입에 조건 걸어서, 맛집, 관광지, 숙소 골라서 보기 가능하도록 할 필요.
//		
//		//객체 생성
//		PlanDAO pdao = new PlanDAO();
//		
//		//DB에 등록된 글의 개수.
//		int count = pdao.getPlanCount();
//		
//		// 한페이지에 보여줄 글의 개수
//		int pageSize = 10;
//
//		// 현페이지가 몇페이지인지 가져오기(기본 1페이지)
//		String pageNum = request.getParameter("pageNum");
//		if (pageNum == null)
//			pageNum = "1"; // pageNum없으면 무조건 1페이지
//
//		// 시작글 구하기 1 11 21 31 ... <= pageNum, pageSize 조합
//		int currentPage = Integer.parseInt(pageNum);
//		int startRow = (currentPage - 1) * pageSize + 1;
//
//		// 끝행구하기
//		int endRow = currentPage * pageSize;
//
//		List<PlanImageBean> planImageList = null;
//		if (count != 0)
//			planImageList = pdao.getPlanList(startRow, pageSize);
//		
//		request.setAttribute("planImageList", planImageList);
//		request.setAttribute("count", count);
//		request.setAttribute("pageNum", pageNum);
//		request.setAttribute("pageSize", pageSize);
//		request.setAttribute("currentPage", currentPage);

		ActionForward forward = new ActionForward();
		forward.setPath("./plan/planNation.jsp");
		forward.setRedirect(false);

		return forward;
	}
}