package net.plan.action;

import java.io.IOException;
import java.security.PrivateKey;
import java.sql.Timestamp;
import java.util.List;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.plan.db.PlanDAO;
import net.plan.db.PlanImageBean;

public class PlanRegionAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PlanRegionAction execute()");
		request.setCharacterEncoding("UTF-8");

		PlanDAO pdao = new PlanDAO();

		int count = pdao.getPlanCount();
		
		// 한페이지에 보여줄 글의 개수
		int pageSize = 10;

		// 현페이지가 몇페이지인지 가져오기(기본 1페이지)
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1"; // pageNum없으면 무조건 1페이지

		// 시작글 구하기 1 11 21 31 ... <= pageNum, pageSize 조합
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행구하기
		int endRow = currentPage * pageSize;

		List<PlanImageBean> planImageList = null;
		if (count != 0)
			planImageList = pdao.getPlanList(startRow, pageSize);

		request.setAttribute("boardList", planImageList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);

		ActionForward forward = new ActionForward();
		forward.setPath("./plan/planRegion.jsp");
		forward.setRedirect(false);

		return forward;
	}
}