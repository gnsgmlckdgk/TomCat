package net.travel.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanDAO;
import net.plan.db.PlanTravelBean;

public class TravelListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("TravelList Action execute()");
		//한글처리 
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		
		PlanDAO pdao =  new PlanDAO();
		
		List<PlanTravelBean> travelList =  pdao.getTravelList();
		
		request.setAttribute("travelList", travelList);
		
		forward = new ActionForward();
		forward.setPath("./plan/travelList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
