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
		int num=Integer.parseInt(request.getParameter("num"));
		//디비객체 생성 agdao
		MyPlanBasketDAO agdao=new MyPlanBasketDAO();
		//GoodsBean goodsbean = 메서드호출 getGoods(num)
		MyPlanBasketBean myplanbasketbean=agdao.get(num);
		//저장 goodsbean
		request.setAttribute("myplanbasketbean", myplanbasketbean);
		//이동 ./admingoods/admin_goods_modify.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admingoods/admin_goods_modify.jsp");
		return forward;
	}
}
