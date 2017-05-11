package net.like.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.like.db.LikeBean;
import net.like.db.LikeDAO;

public class DislikeaddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("DislikeaddAction execute()");
		
		LikeBean lb=new LikeBean();
		LikeDAO ldao=new LikeDAO();
		
		lb.setNick(request.getParameter("nick"));
		lb.setNum(Integer.parseInt(request.getParameter("num")));
		
		ldao.adddislike(lb);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;	
		
		
	
	}

}
