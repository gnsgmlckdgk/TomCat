package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;


public class MyPlanModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("MyPlanModifyAction");
		//한글처리
		request.setCharacterEncoding("utf-8");
		//자바빈 객체 생성 goodsbean
		MyPlanBasketBean myplanbean=new MyPlanBasketBean();
		//폼 => 자바빈 멤버변수 저장
		myplanbean.setId(request.getParameter("id"));
		myplanbean.setPlan_nr(Integer.parseInt(request.getParameter("plan_nr")));
		myplanbean.setTravel_id(Integer.parseInt(request.getParameter("travel_id")));
		myplanbean.setItem_nr(Integer.parseInt(request.getParameter("item_nr")));
		myplanbean.setFirstday(request.getParameter("firstday"));
		myplanbean.setLastday(request.getParameter("lastday"));
		myplanbean.setDay_nr(Integer.parseInt(request.getParameter("day_nr")));
		myplanbean.setDay_night(request.getParameter("day_night"));
		myplanbean.setUser_lat(Float.parseFloat(request.getParameter("user_lat")));
		myplanbean.setUser_lng(Float.parseFloat(request.getParameter("user_lng")));
		myplanbean.setDate(request.getParameter("date"));
		myplanbean.setMemo(request.getParameter("memo"));
		myplanbean.setPlan_done_nr(Integer.parseInt(request.getParameter("plan_done_nr")));
		//디비객체 생성 agdao
		MyPlanBasketDAO mpbd=new MyPlanBasketDAO();
		// 메서드호출 modifyGoods(goodsbean)
		mpbd.modifyMyPlan(myplanbean);
		//이동 ./GoodsList.ag
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./GoodsList.ag");
		return forward;
	}
}
