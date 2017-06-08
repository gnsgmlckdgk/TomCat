package net.Board1.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.boardBean;



public class BoardUpdateAction1 implements Action1{

	@Override
	public ActionForward1 execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("boardupdateaction");
		request.setCharacterEncoding("utf-8");

		net.Board1.db.BoardDAO bdao = new net.Board1.db.BoardDAO();
		net.Board1.db.BoardBean bb = new net.Board1.db.BoardBean();
		
		String pageNum=request.getParameter("pageNum");	
		bb.setNick_name(request.getParameter("nick_name"));
		bb.setPass(request.getParameter("pass"));
		bb.setContent(request.getParameter("content"));
		bb.setSubject(request.getParameter("subject"));
		bb.setNum(Integer.parseInt(request.getParameter("num")));
		System.out.println("BoardupdateAction1 nick_name"+bb.getNick_name());
		int check= bdao.updateBoard(bb);
		if (check == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
			
		} else if(check== 1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정성공');");
			out.println("location.href='./BoardList1.bb?pageNum="+pageNum+"'");
			out.println("</script>");
			out.close();
			return null;
		}

		ActionForward1 forward = new ActionForward1();
		forward.setPath("./board/updateForm1.jsp?pageNum="+pageNum);
		forward.setRedirect(false);
		return forward;
		
	}

}
