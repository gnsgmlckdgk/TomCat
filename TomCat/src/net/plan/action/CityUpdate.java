package net.plan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanCityBean;
import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;

public class CityUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
System.out.println("CityUpdate execute()");
		
		String city_code = request.getParameter("city_code");
		String pageNum = request.getParameter("pageNum");
		
		PlanDAO pdao = new PlanDAO();
		PlanCityBean pcb = pdao.getCity(city_code);
		List<PlanCountryBean> countryList =  pdao.getCountryList();
		
		
		request.setAttribute("countryList", countryList);
		request.setAttribute("pcb", pcb);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./plan/cityUpdate.jsp");
		return forward;
	}

}
