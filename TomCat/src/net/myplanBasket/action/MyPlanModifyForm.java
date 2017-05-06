package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;


public class MyPlanModifyForm implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("MyPlanModifyForm");
		//int num가져오기
		int myplans_id=Integer.parseInt(request.getParameter("myplans_id"));
		//디비객체 생성 agdao
		MyPlanBasketDAO mpbdao=new MyPlanBasketDAO();
		//GoodsBean goodsbean = 메서드호출 getGoods(num)
		MyPlanBasketBean myplanbasketbean=mpbdao.get(myplans_id);
		//저장 goodsbean
		request.setAttribute("myplanbasketbean", myplanbasketbean);
		//이동 ./admingoods/admin_goods_modify.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./myplan/myplanmodify.jsp");
		return forward;
	}
}
