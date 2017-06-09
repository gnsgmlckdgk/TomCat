package net.reply1.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reply.action.ActionForward;
import net.reply1.db.Reply1Bean;
import net.reply1.db.Reply1DAO;

public class ReplyDelete1 implements Action1 {
	@Override
	public ActionForward1 execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReplyDelete execute()");

		
		Reply1DAO rdao=new Reply1DAO();
		Reply1Bean rr=new Reply1Bean();
		
		int num=Integer.parseInt(request.getParameter("num"));		
		String pageNum = request.getParameter("pageNum");
		int re_num=Integer.parseInt(request.getParameter("re_num"));
			
		rdao.deleteReply(re_num);
				
		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.println("<script>");
//			out.println("alert('삭제성공')");
			out.println("location.href='./BoardContent.bo?num="+num+"&pageNum=" + pageNum + "';");
			out.println("</script>");
			out.close();				
	
				return null;

				
	}
}
