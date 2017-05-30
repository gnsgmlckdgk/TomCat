package net.plan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.plan.db.PlanDAO;
import net.plan.db.PlanSouvenirBean;

public class SouvenirUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Souvenirupdate execute()");
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String city_code = request.getParameter("city_code");
		int num = Integer.parseInt(request.getParameter("num"));
		
		PlanDAO pdao = new PlanDAO();
		
		PlanSouvenirBean psb = pdao.getSouvenir(num);
		
		request.setAttribute("psb", psb);
		
		forward.setRedirect(false);
		forward.setPath("./plan/souvenirUpdate.jsp?city_code="+city_code+"&num="+num);
		return forward;
	}

}
