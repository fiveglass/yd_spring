package com.yedam.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	@Value("${file.upload.path}")//외부의 키값으 들들고옴
	//외부값을 해당 필드에 넣어줌
	private String uploadPath;
	
	
	
	
	//페이지
	@GetMapping("upload")
	public void getUploadPage() {
		
	}
	//업로드 할 것 페이지
	
	
	//처리	
	//@RequestPart 이거 처리할려면 MultipartResolver따로 등록 필요함 survletContext에
	@PostMapping("/uploadsAjax")
	@ResponseBody
	public List<String> uploadFile(@RequestPart MultipartFile[] uploadFiles) {
	   
		List<String> imageList = new ArrayList<>();
		
	    for(MultipartFile uploadFile : uploadFiles){
	    	//이미지파일일때 처리하겠다.
	    	if(uploadFile.getContentType().startsWith("image") == false){
	    		System.err.println("this file is not image type");
	    		return null;
	        }
	 
	    	//사용자가 보내온 내용에서 파일이 정확하게 무엇인지에 대해 가져오는 것
	        String originalName = uploadFile.getOriginalFilename();
	        String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
	       
	        //오리지날 파일 이름을 가져옴. 중간 경로는 제외시킴
	        System.out.println("fileName : " + fileName);
	   
	        //날짜 폴더 생성
	        String folderPath = makeFolder();
	       
	        //UUID: 시간을 기준으로 유니크한 값을 가져옴 '초'는 유니크한 값임
	        String uuid = UUID.randomUUID().toString();
	        //저장할 파일 이름 중간에 "_"를 이용하여 구분
	       
	        //해당폴더밑에  UUID를 이용한 폴더 값.
	        String uploadFileName = folderPath +File.separator + uuid + "_" + fileName;
	       
	        //uploadFileName: 파일이름 을 이용한  saveName: 실제경로
	        String saveName = uploadPath + File.separator + uploadFileName;
	         //Path: 파일시스템이 가지고있는 실제 경로를 저장하는 클래스. 자바가 인식할 수 있는 형태로 변환함.
	        //saveName은 그냥 String이므로
	       
	        Path savePath = Paths.get(saveName);
	        //Paths.get() 메서드는 특정 경로의 파일 정보를 가져옵니다.(경로 정의하기)
	        System.out.println("path : " + saveName);
	        //파일 업로드하는 메서드
	        try{
	        	uploadFile.transferTo(savePath);
	            //uploadFile에 파일을 업로드 하는 메서드 transferTo(file)
	        } catch (IOException e) {
	             e.printStackTrace();	            
	        }
	     // DB에 저장하거나 주석처리 할 수 있다.
		    //-uploadFileName
		    imageList.add(setImagePath(uploadFileName));
	     }
	    return imageList;
	}
	
	
	private String makeFolder() {
		// LocalDate.now()오늘날짜 가져옴+ 지역데이터 기반으로 + 문자로 변환시킴
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
		// LocalDate를 문자열로 포멧
		//"/", File.separator 자바가 인식하는 기준으로 체인지 시킴.
		String folderPath = str.replace("/", File.separator);
		//File클래스 이용해서  이용해서 실질 경로 만듦 exists(), mkdirs() 메소드 등...
		
		File uploadPathFoler = new File(uploadPath, folderPath);
		// File newFile= new File(dir,"파일명");
		if (uploadPathFoler.exists() == false) {
			
			uploadPathFoler.mkdirs();
			// 만약 uploadPathFolder가 존재하지않는다면 makeDirectory하라는 의미입니다.
			// mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
			// mkdirs(): 디렉토리의 상위 디렉토리가 존재하지 않을 경우에는 상위 디렉토리까지 모두 생성하는 함수
		}
		return folderPath;
	}
	
	private String setImagePath(String uploadFileName) {
		return uploadFileName.replace(File.separator,"/");
	}
	
}
