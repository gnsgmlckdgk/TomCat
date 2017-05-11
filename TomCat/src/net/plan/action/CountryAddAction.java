package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;

public class CountryAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CountryAddAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		PlanCountryBean pcb = new PlanCountryBean();
		
		pcb.setContinent(request.getParameter("continent"));
		pcb.setCountry_code(request.getParameter("country_code"));
		pcb.setName(request.getParameter("name"));
		pcb.setEn_name(request.getParameter("en_name"));
		pcb.setInfo(request.getParameter("info"));
		
		PlanDAO pdao = new PlanDAO();
		
		pdao.insertCountry(pcb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		out.println("<script>");
		out.println("alert('국가가 추가되었습니다.')");
		out.println("location.href='./countryAdd.pl'");
		out.println("</script>");
		out.close(); 
		
		
		return null;
	}

}
