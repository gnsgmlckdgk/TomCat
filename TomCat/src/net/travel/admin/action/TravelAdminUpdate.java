package net.travel.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.images.db.ImagesDAO;
import net.plan.db.PlanCityBean;
import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;
import net.travel.admin.db.TravelAdminDAO;
import net.travel.admin.db.TravelBean;

public class TravelAdminUpdate implements Action {

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
		
		// 도시 리스트 가져오기(최초 선택된것)
		String country_code = pdao.getCountryCode(travel_id);
		List<PlanCityBean> cityList = pdao.getCityList2(country_code);
		
		request.setAttribute("cityList", cityList);
		
		// 관광지 이미지 들고오기
		ImagesDAO idao = new ImagesDAO();
		String travelImgPath = idao.getTravelImgPath(travel_id);
		
		request.setAttribute("travelImgPath", travelImgPath);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./TravelAdmin/travelUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
