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

		if (command.equals("/PlanRegion.pl")) {	// 지역 페이지 이동
			action = new PlanRegionAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/PlanMain.pl")){	// 여행일정플래너 메인 페이지 이동
			action = new PlanMainAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}	

		} else if (command.equals("/PlanNation.pl")){	// 국가 페이지 이동
			
			action = new Scraping();
			
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
		
		
		
		else if(command.equals("/PlanSpotWriteAction.pl")){
			action = new PlanSpotWriteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		
		}
		
		else if(command.equals("/CountryList.pl")){ //DB에있는 국가리스트 보여주는 페이지 이동
			action = new DBCountryListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/countryAdd.pl")){ //DB에 국가 추가하는 폼 페이지 이동
			forward = new ActionForward();
			forward.setPath("./plan/countryAdd.jsp");
			forward.setRedirect(false);
		}	
		else if(command.equals("/CounAdd.pl")){
			action = new CountryAddAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/CountryUpdate.pl")){//DB에 국가 수정하는 폼 페이지 이동
			action = new CountryUpdate();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/CityAdd.pl")){ //DB에 도시 추가하는 폼 페이지 이동
			action = new CityAddAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
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
