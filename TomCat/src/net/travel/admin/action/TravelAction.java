package net.travel.admin.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.travel.admin.db.TravelAdminDAO;
import net.travel.admin.db.TravelBean;


public class TravelAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String lat=request.getParameter("latitude");
		String lng=request.getParameter("longitude");

		
		String type=request.getParameter("type");
		String country_code=request.getParameter("country_code");
		String city_code=request.getParameter("city_code");
		String name=request.getParameter("name");
				
		 float latitude=Float.parseFloat(lat.trim());
		 float longitude=Float.parseFloat(lng.trim());
		 
		String info=request.getParameter("info");
		String address=request.getParameter("address");
		
	/*	ServletContext context=request.getServletContext();
		String realPath=context.getRealPath("/upload");
		int maxSize=5*1024*1024;
		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		*/
		
		// 자바빈 파일 만들기
		//자바빈 파일 생성 
		TravelBean tBean = new TravelBean();
		// 폼 => 자바빈 저장

/*		tBean.setType(type);
		tBean.setCountry_code(multi.getParameter("country_code"));
		tBean.setCity_code(multi.getParameter("city_code"));
		tBean.setName(multi.getParameter("name"));
		tBean.setLatitude(Float.parseFloat(multi.getParameter("latitude")));
		tBean.setLongitude(Float.parseFloat(multi.getParameter("longitude")));
		tBean.setInfo(multi.getParameter("info"));
		tBean.setAddress(multi.getParameter("address"));*/
	//	System.out.println(realPath);
		
		tBean.setType(type);
		tBean.setCountry_code(country_code);
		tBean.setCity_code(city_code);
		tBean.setName(name);
		tBean.setLatitude(latitude);
		tBean.setLongitude(longitude);
		tBean.setInfo(info);
		tBean.setAddress(address);	
		
		// 디비 파일 만들기 
		// 객체 생성 
		TravelAdminDAO mpl = new TravelAdminDAO();
		//객체 생성 메서드호출 
		mpl.insertTravel(tBean);
		// 이동 ./MyPlan.pln 
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./TravelAdminList.td");

		return forward;
	}

}