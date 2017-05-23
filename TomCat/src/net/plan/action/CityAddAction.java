package net.plan.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import net.plan.db.PlanCityBean;
import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;

public class CityAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CountryAddAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		PlanCityBean pcb = new PlanCityBean();

		pcb.setCountry_code(request.getParameter("country_code"));
		pcb.setName(request.getParameter("name"));
		pcb.setEn_name(request.getParameter("en_name"));
		pcb.setInfo(request.getParameter("info"));
		pcb.setCity_code(request.getParameter("en_name"));
		
		PlanDAO pdao = new PlanDAO();
		
		pdao.insertCity(pcb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		out.println("<script>");
		out.println("alert('도시가 추가되었습니다.')");
		out.println("location.href='./CityList.pl'");
		out.println("</script>");
		out.close(); 
				
		return null;
	}
}


