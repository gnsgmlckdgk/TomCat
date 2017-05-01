package net.myplan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myplan.db.MyPlanBean;
import net.myplan.db.MyPlanDAO;

public class MyPlanAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		MyPlanDAO mpdo = new MyPlanDAO();
		
		List<MyPlanBean> MyPlan = mpdo.MyPlan();

		
		request.setAttribute("MyPlan", MyPlan);
	
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./myplan/map.jsp");
		return forward;

	}

	
}
