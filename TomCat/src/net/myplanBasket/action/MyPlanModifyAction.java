package net.myplanBasket.action;

import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

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

		String id = (String) session.getAttribute("id");

		// 폼 => 자바빈 멤버변수 저장.
		mpbb.setId(id);
		mpbb.setFirstday(request.getParameter("fromDate"));// 출발일
		mpbb.setLastday(request.getParameter("toDate"));// 도착일
//		mpbb.setPlan_nr(request.getParameter("plan_nr"));// plan a or b or c

		//여행일정 day
		int diff_day = Integer.parseInt(request.getParameter("diff_day"));

		//여행일정 만큼 array 길이 생성.
		String b[] = new String[diff_day];
		String plan_nr[] = new String[diff_day];
		String day_nr[] = new String[diff_day];

		for (int i = 1; i <= diff_day; i++) {
			b[i - 1] = request.getParameter("res" + i);
			plan_nr[i - 1] = request.getParameter("plan_nr" + i);
			day_nr[i - 1] = request.getParameter("day_nr" + i);
		}

		//잘들어왔는지 확인하는 for
		for (int i = 0; i < diff_day; i++) {
			System.out.println("b[" + i + "] " + b[i]);
			System.out.println("plan_nr[" + i + "] " + plan_nr[i]);
			System.out.println("day_nr[" + i + "] " + day_nr[i]);
		}

		// mpbb.setTravel_id(Integer.parseInt(request.getParameter("travel_id")));
		// mpbb.setItem_nr(Integer.parseInt(request.getParameter("item_nr")));

		// mpbb.setDay_nr(Integer.parseInt(request.getParameter("day_nr")));
		// mpbb.setDay_night(request.getParameter("day_night"));
		// mpbb.setUser_lat(Float.parseFloat(request.getParameter("user_lat")));
		// mpbb.setUser_lng(Float.parseFloat(request.getParameter("user_lng")));

		// mpbb.setDate(request.getParameter("date"));
		// mpbb.setMemo(request.getParameter("memo"));
		// mpbb.setPlan_done_nr(Integer.parseInt(request.getParameter("plan_done_nr")));

		// 디비객체 생성
		MyPlanBasketDAO mpbd = new MyPlanBasketDAO();

		// 메서드호출
		mpbd.modifyMyPlan(mpbb);


		/*Vector vector1= mpbd.getBasketList_Plan_nr(mpbb);
	
		List basketList1=(List)vector1.get(0);
		List goodsList1=(List)vector1.get(1);
		
		//String str = "plan_nr@day_nr@item_nr";
		//String[]result = mpbd.split("@");


		request.setAttribute("basketList", basketList1);
		request.setAttribute("goodsList", goodsList1);

		// System.out.println("이거이거"+basketList1);

		for (int i = 0; i < basketList1.size(); i++) {
			MyPlanBasketBean mpbb1 = (MyPlanBasketBean) basketList1.get(i);
			System.out.println(mpbb1.getDay_nr());
			System.out.println(mpbb1.getItem_nr());
			System.out.println(mpbb1.getPlan_nr());

			StringTokenizer st = new StringTokenizer(mpbb1.getDay_nr(), "@");
			int n = st.countTokens(); // 남아있는 토큰의 개수를 반환
			for (int j = 0; j < n; j++) {
				System.out.println(st.nextToken());
			}

*/
	
		
		
		
		


//			StringTokenizer st1 = new StringTokenizer(mpbb1.getItem_nr(), "@");
//			int n1 = st1.countTokens(); // 남아있는 토큰의 개수를 반환
//			for (int j1 = 0; j1 < n1; j1++) {
//				System.out.println(st1.nextToken());
//			}
//
//			StringTokenizer st2 = new StringTokenizer(mpbb1.getPlan_nr(), "@");
//			int n2 = st2.countTokens(); // 남아있는 토큰의 개수를 반환
//			for (int j2 = 0; j2 < n2; j2++) {
//				System.out.println(st2.nextToken());
//			}
//		}


		// 이동 ./GoodsList.ag
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MyPlan.pln?plan_nr=" + mpbb.getPlan_nr());
		return forward;
	}
}
