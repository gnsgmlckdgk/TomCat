package net.reply.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reply.action.Action;
import net.reply.action.ActionForward;

import net.board.db.BoardDAO;
import net.board.db.boardBean;
import net.reply.db.ReplyBean;
import net.reply.db.ReplyDAO;


public class ReplyUpdate implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	System.out.println("ReplyUpdate execute()");
	ActionForward forward=new ActionForward();
	request.setCharacterEncoding("utf-8");

	ReplyDAO rdao=new ReplyDAO();

	
	int re_num=Integer.parseInt(request.getParameter("re_num"));	
	ReplyBean rb=rdao.getReply(re_num);

	
//=====================Board Content 에서 가져온소스==================
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");

	
	BoardDAO bdao=new BoardDAO();
			
	boardBean bb=bdao.getBoard(num);		

	
	request.setAttribute("bb", bb);
	request.setAttribute("num", num);
	request.setAttribute("pageNum", pageNum);
	
	

	//============================댓글 Action=====================
			
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
			
			
	
//===============================================================
	
	
	request.setAttribute("rb", rb);
	forward.setPath("./instagram/replyupdate.jsp");
	forward.setRedirect(false);
	return forward;		
	
	}
}
