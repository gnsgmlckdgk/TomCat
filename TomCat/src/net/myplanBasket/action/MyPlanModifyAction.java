package net.myplanBasket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;


public class MyPlanModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("GoodsModifyAction");
		//한글처리
		request.setCharacterEncoding("utf-8");
		//자바빈 객체 생성 goodsbean
		MyPlanBasketBean myplanbean=new MyPlanBasketBean();
		//폼 => 자바빈 멤버변수 저장
		// num  category name price color amount size best content
		myplanbean.setNum(Integer.parseInt(request.getParameter("num")));
		myplanbean.setCategory(request.getParameter("category"));
		myplanbean.setName(request.getParameter("name"));
		myplanbean.setPrice(Integer.parseInt(request.getParameter("price")));
		myplanbean.setColor(request.getParameter("color"));
		myplanbean.setAmount(Integer.parseInt(request.getParameter("amount")));
		myplanbean.setSize(request.getParameter("size"));
		myplanbean.setBest(Integer.parseInt(request.getParameter("best")));
		myplanbean.setContent(request.getParameter("content"));
		//디비객체 생성 agdao
		MyPlanBasketDAO agdao=new MyPlanBasketDAO();
		// 메서드호출 modifyGoods(goodsbean)
		agdao.modifyPlan(myplanbean);
		//이동 ./GoodsList.ag
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./GoodsList.ag");
		return forward;
	}
}
