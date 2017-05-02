package net.plan.action;

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
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./plan/planWriteTest.jsp");
		forward.setRedirect(false);

		return forward;
	}
}