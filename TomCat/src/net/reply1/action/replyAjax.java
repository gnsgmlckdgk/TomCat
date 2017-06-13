package net.reply1.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board1.action.ActionForward1;
import net.reply.action.Action;
import net.reply.action.ActionForward;
import net.reply1.db.Reply1Bean;
import net.reply1.db.Reply1DAO;

public class replyAjax implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	int num= Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	
		Reply1DAO rdao = new Reply1DAO();
		List<Reply1Bean> replyList=rdao.getReplyList(1,10,num);
		request.setAttribute("replyList", replyList);
		System.out.println(replyList.size());
		
		ActionForward forward=new ActionForward();
		forward.setPath("./board/list1.jsp?pageNum="+pageNum);
		forward.setRedirect(false);
		return forward;
		
	}

}
