package net.myplan.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.myplan.admin.db.MyPlanBean;
import net.myplan.admin.db.MyPlanDAO;

public class TravelDataAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ServletContext context=request.getServletContext();
		String realPath=context.getRealPath("/upload");
		int maxSize=5*1024*1024;
		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		// 자바빈 파일 만들기
		//자바빈 파일 생성 
		MyPlanBean mplBean=new MyPlanBean();
		// 폼 => 자바빈 저장
		mplBean.setMyplans_id(Integer.parseInt(multi.getParameter("myplans_id")));
		mplBean.setId(multi.getParameter("id"));
		mplBean.setPlan_nr(Integer.parseInt(multi.getParameter("plan_nr")));
		mplBean.setTravel_id(Integer.parseInt(multi.getParameter("travel_id")));
		mplBean.setItem_nr(Integer.parseInt(multi.getParameter("item_nr")));
		mplBean.setFirstday(multi.getParameter("firstday"));
		mplBean.setLastday(multi.getParameter("lastday"));
		mplBean.setDay_nr(Integer.parseInt(multi.getParameter("day_nr")));
		mplBean.setDay_night(multi.getParameter("day_night"));
		mplBean.setUser_lat(Float.parseFloat(multi.getParameter("user_lat")));
		mplBean.setUser_lng(Float.parseFloat(multi.getParameter("user_lng")));
		mplBean.setDate(multi.getParameter("date"));
		mplBean.setMemo(multi.getParameter("memo"));
		mplBean.setPlan_done_nr(Integer.parseInt(multi.getParameter("plan_done_nr")));
		System.out.println(realPath);
		
		// 디비 파일 만들기 
		// 객체 생성 
		MyPlanDAO mpl = new MyPlanDAO();
		//객체 생성 메서드호출 
		mpl.insertMyplan(mplBean);
		// 이동 ./MyPlan.pln 
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MyPlan.pln");
		return forward;
	}

}