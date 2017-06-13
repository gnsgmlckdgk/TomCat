package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPlanDelete.java");
		
		HttpSession session = request.getSession();
		
		// 파라미터 가져오기
		String id = (String)session.getAttribute("id");
		String plan_nr = request.getParameter("plan_nr");	// 1: plan A, 2: plan B, 3: plan C
		
		// 삭제 작업
		MyPlanBasketDAO mpbd = new MyPlanBasketDAO();
		mpbd.deletePlan(id, plan_nr);
		
		// 이동정보 반환
		ActionForward forward = new ActionForward();
		forward.setPath("./MyPlan.pln?plan_nr="+plan_nr);
		forward.setRedirect(true);
		return forward;
	}
	
}
