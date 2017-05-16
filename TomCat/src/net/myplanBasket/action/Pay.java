package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;

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
			return forward;

		} else {
			
			MemberBean mb = (MemberBean)mpdao.getTelName(id);
			
			System.out.println(id);
			System.out.println(mb.getName());
			
			request.setAttribute("name", mb.getName());
			request.setAttribute("tel", mb.getTel());
						
			forward.setPath("./Pay.pln");
			forward.setRedirect(false);
			return forward;
		}
		// end content

		
	}
}