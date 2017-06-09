package net.reply1.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reply.action.ActionForward;
import net.reply1.db.Reply1Bean;
import net.reply1.db.Reply1DAO;

public class RreplyUpdateAction1 implements Action1 {
	@Override
	public ActionForward1 execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		
		int num=Integer.parseInt(request.getParameter("num"));

		ActionForward forward = new ActionForward();

		Reply1DAO rdao = new Reply1DAO();
		Reply1Bean rr = new Reply1Bean();

		String pageNum = request.getParameter("pageNum");
		
		rr.setContent(request.getParameter("content"));
		rr.setNick(request.getParameter("nick"));
		rr.setRe_num(Integer.parseInt(request.getParameter("re_num")));
		
		rdao.updateReply(rr);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
//		out.println("alert('수정성공')");
		out.println("location.href='./BoardContent.bo?num="+num+"&pageNum=" + pageNum + "';");
		out.println("</script>");
		out.close();

		return null;

	}
}
