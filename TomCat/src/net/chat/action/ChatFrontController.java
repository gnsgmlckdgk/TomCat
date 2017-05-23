package net.chat.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.action.Action;
import net.plan.action.ActionForward;
import net.plan.action.CityAction;
import net.plan.action.CityAddAction;
import net.plan.action.CityDelete;
import net.plan.action.CityUpdate;
import net.plan.action.CityUpdateAction;
import net.plan.action.CountryAddAction;
import net.plan.action.CountryDelete;
import net.plan.action.CountryUpdate;
import net.plan.action.CountryUpdateAction;
import net.plan.action.DBCityListAction;
import net.plan.action.DBCountryListAction;
import net.plan.action.PlanMainAction;
import net.plan.action.PlanNationAction;
import net.plan.action.PlanRegionAction;
import net.plan.action.PlanSearchAction;
import net.plan.action.PlanSpot;

public class ChatFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uriPath = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uriPath.substring(contextPath.length());

		// 이동정보 담는 객체
		ActionForward forward = null;
		// 처리담당 객체
		Action action = null;

		if (command.equals("/Chat.ct")) { // DB에 국가 추가하는 폼 페이지 이동
			forward = new ActionForward();
			forward.setPath("./chat/broadcast.jsp");
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
