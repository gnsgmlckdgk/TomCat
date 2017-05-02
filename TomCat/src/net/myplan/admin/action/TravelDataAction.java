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
		
		mplBean.setType(multi.getParameter("type"));
		mplBean.setCountry_code(multi.getParameter("country_code"));
		mplBean.setCity_code(multi.getParameter("city_code"));
		mplBean.setName(multi.getParameter("name"));
		mplBean.setLatitude(multi.getParameter("latitude"));
		mplBean.setLongitude(multi.getParameter("longitude"));
		mplBean.setInfo(multi.getParameter("info"));
		mplBean.setAddress(multi.getParameter("address"));
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