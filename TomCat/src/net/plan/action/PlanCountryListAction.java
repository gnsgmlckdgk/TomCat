package net.plan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;

public class PlanCountryListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		
		System.out.println("countryList execute()");
		
		PlanDAO pdao = new PlanDAO();
		int count = pdao.getCountryCount();

		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage =Integer.parseInt(pageNum);
		int startRow =(currentPage -1) * pageSize +1;
		
		int endRow = currentPage * pageSize; 
		
		List countryList = null;
		if(count != 0){
			
		}
		
		
		
		request.setAttribute("countL", countryList);
		
		
		forward = new ActionForward();
		forward.setPath("./plan/countryList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
