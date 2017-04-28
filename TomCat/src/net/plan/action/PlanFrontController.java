package net.plan.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlanFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uriPath = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uriPath.substring(contextPath.length());

		// 이동정보 담는 객체
		ActionForward forward = null;
		// 처리담당 객체
		Action action = null;

		if (command.equals("/PlanRegion.pl")) {
			action = new PlanRegionAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/PlanMain.pl")){
			forward = new ActionForward();
			forward.setPath("./plan/planMain.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/PlanNation.pl")){
			action = new PlanNationAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}


		}else if(command.equals("/PlanSearch.pl")){
			action = new PlanSearchAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}

		} else if (command.equals("/PlanSpotWrite.pl")){
			forward = new ActionForward();
			forward.setPath("./plan/planSpotWrite.jsp");
			forward.setRedirect(false);

		}
		
		


		if (forward != null) {
			if (forward.isRedirect()) { // response방식
				response.sendRedirect(forward.getPath());
			} else { // forward방식
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
