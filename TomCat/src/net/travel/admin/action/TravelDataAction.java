package net.travel.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.travel.admin.db.TravelAdminDAO;
import net.travel.admin.db.TravelBean;


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
		TravelBean tBean = new TravelBean();
		// 폼 => 자바빈 저장

		tBean.setType(multi.getParameter("type"));
		tBean.setCountry_code(multi.getParameter("country_code"));
		tBean.setCity_code(multi.getParameter("city_code"));
		tBean.setName(multi.getParameter("name"));
		tBean.setLatitude(Float.parseFloat(multi.getParameter("latitude")));
		tBean.setLongitude(Float.parseFloat(multi.getParameter("longitude")));
		tBean.setInfo(multi.getParameter("info"));
		tBean.setAddress(multi.getParameter("address"));
		System.out.println(realPath);
		
		// 디비 파일 만들기 
		// 객체 생성 
		TravelAdminDAO mpl = new TravelAdminDAO();
		//객체 생성 메서드호출 
		mpl.insertTravel(tBean);
		// 이동 ./MyPlan.pln 
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./TravelAdmin.td");
		return forward;
	}

}