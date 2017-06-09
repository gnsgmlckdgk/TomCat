package net.reply1.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action1 {
	//추상메서드 - 메서드  틀
	public ActionForward1 execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
