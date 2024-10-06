package model.dashboard;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import db.dto.ProjectDTO;
import db.dto.TaskDTO;

public class Proj_subfn {
	public String remainDate(ProjectDTO dto) {

		Date now = new Date();
		Date endDate = dto.getProj_enddate();

		long differenceInMillies = endDate.getTime() - now.getTime();
		long remainDate = differenceInMillies / (1000 * 60 * 60 * 24);

		if (remainDate > 0) {

			return String.valueOf(remainDate)+" 일";
		}
		else if (remainDate == 0) {
			return "마감 당일";
		}
		else if (remainDate < 0) {
			return "마감 기한 초과";
		}
		return "";
	}
	
	public String progression(ArrayList<TaskDTO> list) {

		int totalTask = list.size();
		int completeTask = 0;
		double percentage = 0;
		
		for(TaskDTO d : list) {
			if(d.getTask_status().equals("완료")) {
				completeTask++;
			}
		}
		percentage = Math.round(completeTask*1.0/totalTask*100);
		
		return percentage+"%";
	}
}
