package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanBasketAllDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터 값 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id") ;
		
		// DB처리
		MyPlanBasketDAO mpbdao = new MyPlanBasketDAO();
		mpbdao.deleteAllBasket(id);
		
		// 이동정보
		ActionForward forward = new ActionForward();
		forward.setPath("./MyPlan.pln?plan_nr=100");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
