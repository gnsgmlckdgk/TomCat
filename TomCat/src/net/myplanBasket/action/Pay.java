package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;

public class Pay implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("Pay 실행!");
		//한글처리
		request.setCharacterEncoding("utf-8");
				
		//content
		
		
		
		
		
		//end content		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MyPlan.pln?plan_nr=100");
		return forward;
	}
}