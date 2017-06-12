package net.myplanBasket.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.myplanBasket.db.MyPlanBasketBean;
import net.myplanBasket.db.MyPlanBasketDAO;

public class MyPlanModifyForm implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPlanModifyForm");
		// 세션 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String fromdate = request.getParameter("fromDate");
		String todate = request.getParameter("toDate");

		// 세션값 없으면 ./MemberLogin.me
		ActionForward forward = new ActionForward();
		if (id != null) {

			/*
			 * forward.setRedirect(true);
			 * forward.setPath("./MemberLoginAction.me"); return forward;
			 */

			// BasketDAO 객체 생성 basketdao
			MyPlanBasketDAO basketdao = new MyPlanBasketDAO();

			MyPlanBasketBean mpbb = new MyPlanBasketBean();

			System.out.println("beand값 " + mpbb.getPlan_nr());

			// Vector vector= 메서드호출 getBasketList(String id)
			// => Vector vector=new Vector();
			Vector vector = basketdao.getBasketList(id);
			System.out.println("vect값 : " + vector.get(0));

			// List basketList = vector 첫번째데이터
			List basketList = (List) vector.get(0);

			// List goodsList = vector 두번째데이터
			List goodsList = (List) vector.get(1);

			// 저장 basketList goodsList
			request.setAttribute("basketList", basketList);
			request.setAttribute("goodsList", goodsList);

			DateList t = new DateList();
			int tt = t.getDiffDay(fromdate, todate);

			System.out.println("t.getDiffDay(fromdate, todate) : " + tt);
			
			List datelist;

			if (tt > 1) {
				if (tt == 3) {
					// 3박4일일경우
					datelist = new ArrayList();
					datelist.add(fromdate);

					datelist.add(todate);

				} else if (tt == 2) {
					// 2박3일일경우
					datelist = new ArrayList();
					datelist.add(fromdate);
					datelist.add(todate);

				} else if (tt == 1) {
					// 1박2일일경우
					datelist = new ArrayList();
					datelist.add(fromdate);
					datelist.add(todate);

				} else {
					datelist = t.Date(fromdate, todate);

				}
				request.setAttribute("datelist", datelist);

			}

			// 이동 ./goods_order/goods_basket.jsp
			System.out.println("myplanbasketModifyfrom 진입");

		}
		forward.setRedirect(false);
		forward.setPath("./myplan/myplanModify.jsp");
		return forward;

	}
}
