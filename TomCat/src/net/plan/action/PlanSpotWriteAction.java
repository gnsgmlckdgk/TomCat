package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlanSpotWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PlanSpotWriteAction execute()");
		request.setCharacterEncoding("UTF-8");


		System.out.println(request.getParameter("nation"));
		System.out.println(request.getParameter("region"));
		System.out.println(request.getParameter("type"));
		
		
		request.getParameter("smarteditor");
		System.out.println(request.getParameter("smarteditor"));
		
		//임시 페이지 보내기 index.jsp
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('콘솔창 확인 ㄱㄱ');");
		out.println("location.href='./index.jsp'");
		out.println("</script>");
		out.close();
		//임시 페이지 보내기 index.jsp
		
		ActionForward forward = new ActionForward();
		forward.setPath("./plan/planRegion.jsp");
		forward.setRedirect(false);

		return forward;
	}
}