package net.like.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.like.action.ActionForward;
import net.like.db.LikeBean;
import net.like.db.LikeDAO;

public class LikeaddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("LikeaddAction execute()");
		
		LikeBean lb=new LikeBean();
		LikeDAO ldao=new LikeDAO();
		
		String nick=request.getParameter("nick");		
		lb.setNick(nick);
		lb.setNum(Integer.parseInt(request.getParameter("num")));
		
		ldao.addLike(lb);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;	
		

	}


}
