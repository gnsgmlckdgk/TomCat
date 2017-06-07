package net.travel.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanCityBean;
import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;
import net.travel.admin.db.TravelAdminDAO;
import net.travel.admin.db.TravelBean;

public class TravelAdminUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터 값 가져오기
		int travel_id = Integer.parseInt(request.getParameter("travel_id"));
		
		// 관광지 값 가져오기
		TravelAdminDAO tadao = new TravelAdminDAO();
		TravelBean tb = tadao.getTravelBean(travel_id);
		
		request.setAttribute("travelBean", tb);
		
		// 국가 리스트 가져오기
		PlanDAO pdao = new PlanDAO();
		List<PlanCountryBean> countyList = pdao.getCountryList();
		
		request.setAttribute("countyList", countyList);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./TravelAdmin/travelUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
