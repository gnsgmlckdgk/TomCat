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

		// mpbb.setPlan_nr(request.getParameter("plan_nr"));// plan a or b or c

		// 디비객체 생성
		MyPlanBasketDAO mpbd = new MyPlanBasketDAO();

		// 여행일정 day
		int diff_day = Integer.parseInt(request.getParameter("diff_day"));

		// 여행일정 만큼 array 길이 생성.
		String bb[] = new String[diff_day];
		String pplan_nr[] = new String[diff_day];
		String dday_nr[] = new String[diff_day];

		for (int i = 1; i <= diff_day; i++) {
			bb[i - 1] = request.getParameter("res" + i);
			pplan_nr[i - 1] = request.getParameter("plan_nr" + i);
			dday_nr[i - 1] = request.getParameter("day_nr" + i);
		}

		String fin_mpln_id = null;
		String fin_p_nr = null; // plan_nr에 들어갈 내용
		String fin_d_nr = null; // day_nr에 들어갈 내용
		String fin_i_nr = null; // item_nr에 들어갈 내용

		for (int i = 0; i < diff_day; i++) { // 몇일째 일정인지 구분.

			for (int k = 0; k < bb[i].split("@").length; k++) {// 그날의 몇번째 일정인지
																// 구분.

				mpbb = new MyPlanBasketBean();

				mpbb.setId(id);

				String first = request.getParameter("fromDate");
				String last = request.getParameter("toDate");

				fin_mpln_id = bb[i].split("@")[k];

				mpbb.setFirstday(first);// 출발일
				mpbb.setLastday(last);// 도착일

				// 2. fin_mpln_id 값으로 plan_nr이 비어있는지 확인한 후,
				MyPlanBasketBean mpbb2 = mpbd.selectModifyMyPlan(fin_mpln_id);

				System.out.println(mpbb2.getPlan_nr());

				if (mpbb2.getPlan_nr() == null) { // 3. 비었으면 이쪽으로.

					fin_p_nr = pplan_nr[i].split("@")[k] + "@";
					fin_d_nr = dday_nr[i].split("@")[k] + "@";
					fin_i_nr = (k + 1) + "@";

				} else if (mpbb2.getPlan_nr() != null) { // 4. 안비었으면 이쪽으로.

					fin_p_nr = mpbb2.getPlan_nr() + pplan_nr[i].split("@")[k] + "@";
					fin_d_nr = mpbb2.getDay_nr() + dday_nr[i].split("@")[k] + "@";
					fin_i_nr = mpbb2.getItem_nr() + (k + 1) + "@";
				}

				// 1. 여기서 dao로 db에 넣고.

				mpbb.setPlan_nr(fin_p_nr);
				mpbb.setDay_nr(fin_d_nr);
				mpbb.setItem_nr(fin_i_nr);
				// 메서드호출
				mpbd.modifyMyPlan(mpbb, fin_mpln_id);

				System.out.println(fin_mpln_id + "에 plan_nr은 " + fin_p_nr + "이고, ");
				System.out.println("day_nr은 " + fin_d_nr + ", item_nr은 " + fin_i_nr);
				System.out.println("");

			} // 그날의 몇번째 일정인지 구분. 끝.

		} // 몇일째 일정인지 구분. 끝.

		// 이동 ./GoodsList.ag
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MyPlan.pln?plan_nr=" + request.getParameter("plan_nr"));
		return forward;
	}
}
