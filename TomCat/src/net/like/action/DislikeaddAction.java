package net.like.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.boardBean;
import net.like.db.LikeBean;
import net.like.db.LikeDAO;

public class DislikeaddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		System.out.println("DislikeaddAction execute()");
		
		
		//좋아요테이블의 좋아요 취소
		LikeBean lb=new LikeBean();
		LikeDAO ldao=new LikeDAO();
		
		lb.setNick(request.getParameter("nick"));
		lb.setNum(Integer.parseInt(request.getParameter("num")));
		
		ldao.adddislike(lb);
		
		
		//게시판 테이블의 좋아요 취소
		
				boardBean bb=new boardBean();
				BoardDAO bdao=new BoardDAO();
				bb.setNum(Integer.parseInt(request.getParameter("num")));
				bb.setSubject(request.getParameter("subject"));
				bb.setContent(request.getParameter("content"));
				bb.setImage1(request.getParameter("image1"));
				bb.setLove(Integer.parseInt(request.getParameter("love")));
				bb.setNick(request.getParameter("nick"));
				
				
				bdao.GramDisLike(bb);
		
		

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;	
		
		
	
	}

}
