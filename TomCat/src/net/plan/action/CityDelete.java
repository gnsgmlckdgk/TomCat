package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanDAO;

public class CityDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CityDelete execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		String city_code = request.getParameter("city_code");
		
		PlanDAO pdao = new PlanDAO();
		int check =  pdao.deleteCity(city_code);
		
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다');");
			out.println("location.href='./CityList.pl?pageNum="+pageNum+"'");
			out.println("</script>");
			out.close();
			return null;
		}
		return null;
	}

}
