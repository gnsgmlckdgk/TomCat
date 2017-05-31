package net.chat.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.plan.db.PlanDAO;

public class ChatAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");		
		System.out.println("ChatAction execute()");
		
		MemberBean mb= new MemberBean();
		MemberDAO mdao = new MemberDAO();
		
		//골드 회원인지 판별하기
		

		ActionForward forward = new ActionForward();
		forward.setPath("/Chat.ct");
		forward.setRedirect(false);
		return forward;	

	}

}