package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanDAO;
import net.plan.db.PlanSouvenirBean;

public class SouvenirDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SouvenirDelete execute()");
		
		PlanDAO pdao = new PlanDAO();
		String city_code = request.getParameter("city_code");
		int num = Integer.parseInt(request.getParameter("num"));
		
		pdao.deleteSouvenir(num);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		out.println("<script>");
		out.println("alert('삭제되었습니다.')");
		out.println("location.href='./SouvenirList.pl?city_code="+city_code+"'");
		out.println("</script>");
		out.close();
		
		return null;
	}

}
