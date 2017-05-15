package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanCityBean;
import net.plan.db.PlanDAO;

public class CityUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CityUpdateAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		PlanCityBean pcb =  new PlanCityBean();
		pcb.setCity_code(request.getParameter("city_code"));
		pcb.setCountry_code(request.getParameter("country_code"));
		pcb.setName(request.getParameter("name"));
		pcb.setEn_name(request.getParameter("en_name"));
		pcb.setInfo(request.getParameter("info"));
		
		PlanDAO pdao = new PlanDAO();
		
		int check = pdao.updateCity(pcb);
		
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.println("<script>");
			out.println("alert('수정되었습니다.')");
			out.println("location.href='./CityList.pl'");
			out.println("</script>");
			out.close(); 
			}
		return null;
	}

}
