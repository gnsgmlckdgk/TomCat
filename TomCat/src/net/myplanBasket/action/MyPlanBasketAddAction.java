package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanBasketAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션값 가져오기
		//세션값 없으면  ./MemberLogin.me
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ActionForward forward=new ActionForward();
		if(id==null){
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		//한글처리
		request.setCharacterEncoding("utf-8");
		//자바빈 파일 만들기 net.basket.db  BasketBean
		//객체생성 BasketBean basketbean 
		MyPlanBasketBean basketbean =new MyPlanBasketBean();
		//폼 => 자바빈 저장  num  amount size color  id
		private int myplans_id;
		private String id;
		private int plan_nr;
		private int travel_id;
		private int item_nr;
		private String firstday;
		private String lastday;
		private int day_nr;
		private String day_night;
		private float user_lat;
		private float user_lng;
		private String date;
		private String memo;
		private int plan_done_nr;
		
		basketbean.setId(request.getParameter("id"));
		basketbean.setPlan_nr(Integer.parseInt(request.getParameter("plan_nr")));
		basketbean.setTravel_id(Integer.parseInt(request.getParameter("travel_id")));
		basketbean.setItem_nr(Integer.parseInt(request.getParameter("item_nr")));
		basketbean.setB_g_color(request.getParameter("color"));
		basketbean.setB_g_size(request.getParameter("size"));
		basketbean.setB_m_id(id);
		
		//디비 파일 만들기 net.basket.db BasketDAO
		//객체 생성 basketdao
		MyPlanBasketDAO basketdao=new MyPlanBasketDAO();
		//int check=상품 중복체크 중복이면 수량 update <= 1
		//      checkGoods(BasketBean basketbean)
		int check=basketdao.checkGoods(basketbean);
		if(check!=1){
		//메서드호출 basketAdd(basketbean)
		basketdao.basketAdd(basketbean);
		}
		//이동 ./BasketList.ba
		forward.setRedirect(true);
		forward.setPath("./BasketList.ba");
		return forward;
	}
}



