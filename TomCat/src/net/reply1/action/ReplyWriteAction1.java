package net.reply1.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.Board1.db.BoardBean;
import net.board.db.boardBean;
import net.reply.action.Action;
import net.reply.action.ActionForward;

import net.reply.db.ReplyBean;
import net.reply.db.ReplyDAO;
import net.reply1.db.Reply1Bean;
import net.reply1.db.Reply1DAO;

public class ReplyWriteAction1 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReplyWriteAction execute()");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String nick_name = (String) session.getAttribute("nick_name");

		Reply1DAO rdao = new Reply1DAO();
		Reply1Bean rr = new Reply1Bean();

		BoardBean bb = new BoardBean();
		bb.setSubject(request.getParameter("subject"));

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		rr.setNum(num);

//		System.out.println("ReplyWrite액션에서num의 값" + num);
		System.out.println("ReplyWrite액션에서nick의 값" + nick_name);

		rr.setContent(request.getParameter("content"));
		rr.setNick(nick_name);

		rr.setRe_lev(Integer.parseInt(request.getParameter("re_ref")));
		rr.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		rr.setRe_num(Integer.parseInt(request.getParameter("re_num")));
		rr.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));

		rdao.insertRepley(rr);

		ActionForward forward = new ActionForward();
		forward.setPath("./BoardContent1.bb?num=" + num + "&pageNum=" + pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
