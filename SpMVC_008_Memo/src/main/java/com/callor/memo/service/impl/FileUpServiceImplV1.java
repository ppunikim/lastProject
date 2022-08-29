package com.callor.memo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.memo.service.FileUpService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileUpServiceImplV1 implements FileUpService{

	//servlet-context에 선언된 문자열 변수 값 연결하는 코드 
	@Autowired
	protected String upLoadFolder;
	
	@Override
	public String fileUp(MultipartFile file) {
		if(file == null) {
			return null;
		}
		//저장할 폴더 확인(java.io.file)
		File dir = new File(upLoadFolder);
		//업로드할 폴더가 없으면
		if(dir.exists() == false) {
			//폴더를 만들어라.
			dir.mkdirs();
		}
		//업로드 된 파일의 이름 getter하기
		String originFileName = file.getOriginalFilename();
		//해킹 방지를 위해 파일 이름 변경하기
		String uuStr = UUID.randomUUID().toString();
		String saveFileName = String.format("%s-%s", uuStr, originFileName);
		//서버에 저장하기 위한 파일 객체 생성
		File saveFile = new File(upLoadFolder,saveFileName);
		try {
			file.transferTo(saveFile);
			return saveFileName;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<String> filesUp(MultipartHttpServletRequest files) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void fileDelete(String fileName) {
		if(fileName == null) {
			return;
		}
		//업로드할 폴더와 파일 이름을 묶어 파일 객체 생성
		File deleteFile = new File(upLoadFolder, fileName);
		//실제 파일이 존재하는지 확인하고 존재하면 파일 삭제
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	@Override
	public boolean fileCheck(String fileName) {
		File file = new File(upLoadFolder, fileName);
		log.debug(file.exists() + "'");
		return file.exists();
	}

}//end class
