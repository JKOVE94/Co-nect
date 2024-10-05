package model.dashboard;
import java.util.HashMap;




public class Proj_TagColor {

	HashMap<String,String> colorMap = new HashMap();
	
	// Map 에 색상 코드 저장
	public Proj_TagColor() {
		colorMap.put("blue","#33A1FD");
		colorMap.put("red","#D20162");
		colorMap.put("green","#23C11B");
		colorMap.put("orange","#F79824");
		colorMap.put("black","#31393C");
	}
	
	//색상 코드 변경 메서드
	public String TagCodeReturn(String color) {
		String colorCode = null;
		colorCode = colorMap.get(color);
		return colorCode;
	}
		
		
}
