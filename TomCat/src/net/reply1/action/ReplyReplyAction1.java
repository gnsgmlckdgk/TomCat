package net.reply1.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board1.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.db.boardBean;
import net.reply.action.ActionForward;
import net.reply.db.ReplyBean;
import net.reply.db.ReplyDAO;
import net.reply1.db.Reply1DAO;

public class ReplyReplyAction1 implements Action1{

	@Override
	public ActionForward1 execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardContentAction");	
		request.setCharacterEncoding("utf-8");
		ActionForward1 forward=new ActionForward1();

		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");

		
		net.Board1.db.BoardDAO bdao=new net.Board1.db.BoardDAO();
				
		BoardBean bb=bdao.getBoard(num);		

		
		request.setAttribute("bb", bb);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
//============================댓글 Action=====================
		
		Reply1DAO rdao = new Reply1DAO();
		int count = rdao.replyCount(num);
		int pageSize = 5;
		
		if (pageNum == null) {//pageNum 이 없으면
			pageNum = "1";//무조건 1페이지
		}
		int currentPage = Integer.parseInt(pageNum);
		int startrow = (currentPage - 1) * pageSize + 1;
		 // 시작 줄 	=	(3-1)			* 10 +1 =21 줄부터시작!
		int endRow=currentPage*pageSize;
		//  끝줄 = 	3*10 =30줄까지!
		
		//list를 사용하여 list.jsp에 넘겨줄 값들 setAtrribute에 담기
		List replylist=null;
		if(count!=0){
			replylist=rdao.getReplyList(startrow, pageSize,num);
		}
		
		request.setAttribute("rl", replylist);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startrow", startrow);
		request.setAttribute("endRow", endRow);		
		
		
		forward.setPath("./board/list1.jsp");
		forward.setRedirect(false);
		
		return forward;

	
	}
	

}
