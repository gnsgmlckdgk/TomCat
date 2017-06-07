package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanModifyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPlanModifyAction");

		// 한글처리
		request.setCharacterEncoding("utf-8");

		// 자바빈 객체 생성 goodsbean
		MyPlanBasketBean mpbb = new MyPlanBasketBean();

		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		// 폼 => 자바빈 멤버변수 저장.
		mpbb.setId(id);
		mpbb.setFirstday(request.getParameter("fromDate"));//출발일
		mpbb.setLastday(request.getParameter("toDate"));//도착일
		mpbb.setPlan_nr(request.getParameter("plan_nr"));//plan a or b or c
		
		int diff_day = Integer.parseInt(request.getParameter("diff_day"));
		
//		mpbb.setTravel_id(Integer.parseInt(request.getParameter("travel_id")));
//		mpbb.setItem_nr(Integer.parseInt(request.getParameter("item_nr")));
		
//		mpbb.setDay_nr(Integer.parseInt(request.getParameter("day_nr")));
//		mpbb.setDay_night(request.getParameter("day_night"));
//		mpbb.setUser_lat(Float.parseFloat(request.getParameter("user_lat")));
//		mpbb.setUser_lng(Float.parseFloat(request.getParameter("user_lng")));

//		mpbb.setDate(request.getParameter("date"));
//		mpbb.setMemo(request.getParameter("memo"));
//		mpbb.setPlan_done_nr(Integer.parseInt(request.getParameter("plan_done_nr")));

		// 디비객체 생성 agdao
		MyPlanBasketDAO mpbd = new MyPlanBasketDAO();

		// 메서드호출 modifyGoods(goodsbean)
		mpbd.modifyMyPlan(mpbb);

		// 이동 ./GoodsList.ag
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MyPlan.pln?plan_nr="+mpbb.getPlan_nr());
		return forward;
	}
}
