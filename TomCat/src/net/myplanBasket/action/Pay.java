package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;

public class Pay implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PayAction 실행!");
		// 한글처리
		request.setCharacterEncoding("utf-8");

		// content
		String id = (String) request.getParameter("id");
		int approval = Integer.parseInt(request.getParameter("approval"));

		MyPlanBasketDAO mpdao = new MyPlanBasketDAO();

		ActionForward forward = new ActionForward();
		if (approval == 1) {

			mpdao.insertGoldMember(id);
			
			forward.setRedirect(true);
			forward.setPath("./MyPlan.pln?plan_nr=100");
		} else {
			
			mpdao.getTel(id);
			
			forward.setRedirect(false);
			forward.setPath("./Pay.pln");
		}
		// end content

		return forward;
	}
}