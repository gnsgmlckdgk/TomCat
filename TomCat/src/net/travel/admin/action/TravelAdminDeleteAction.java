package net.travel.admin.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.images.db.ImagesDAO;
import net.plan.db.PlanDAO;

// DB에서 관광지 삭제
public class TravelAdminDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 파라미터 가져오기
		String travel_id_str = request.getParameter("travel_id");
		int travel_id = Integer.parseInt(travel_id_str);
		
		// 관광지 이미지 삭제
		ImagesDAO idao = new ImagesDAO();
		String path = idao.getTravelImgPath(travel_id);
		String imgPath = request.getSession().getServletContext().getRealPath("./images/plan/nation/") + path;
		
		File file = new File(imgPath);
		if(file.exists()) { // 파일이 존재하면
			file.delete();	// 파일 삭제
		}
		idao.deleteTravelImages(travel_id);	// 이미지 DB 정보 삭제
		
		// 관광지 삭제
		PlanDAO pdao = new PlanDAO();
		pdao.deleteTravel(travel_id);
		
		// 이동정보 반환
		ActionForward forward = new ActionForward();
		forward.setPath("./TravelAdminList.td");
		forward.setRedirect(true);
		
		return forward;
	}
}
