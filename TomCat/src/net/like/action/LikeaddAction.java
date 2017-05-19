package net.like.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.boardBean;
import net.like.action.ActionForward;
import net.like.db.LikeBean;
import net.like.db.LikeDAO;

public class LikeaddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		//좋아요 테이블
		System.out.println("LikeaddAction execute()");
		
		LikeBean lb=new LikeBean();
		LikeDAO ldao=new LikeDAO();
		
		String nick=request.getParameter("nick");		
		lb.setNick(nick);
		lb.setNum(Integer.parseInt(request.getParameter("num")));
		
		ldao.addLike(lb);
		
		//게시판 테이블
		
		boardBean bb=new boardBean();
		BoardDAO bdao=new BoardDAO();
		bb.setNum(Integer.parseInt(request.getParameter("num")));
		bb.setSubject(request.getParameter("subject"));
		bb.setContent(request.getParameter("content"));
		bb.setImage1(request.getParameter("image1"));
		bb.setLove(Integer.parseInt(request.getParameter("love")));
		bb.setNick(request.getParameter("nick"));
		
		
		bdao.GramAddLike(bb);
		
		
		

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;	
		

	}


}
