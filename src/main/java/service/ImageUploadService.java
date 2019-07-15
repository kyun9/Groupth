package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class ImageUploadService {
	@Autowired
	ServletContext context;
	public ImageUploadService() {
	}
	public boolean getImagePath(MultipartFile img) throws IOException {
		boolean result =false;
		String fileName =img.getOriginalFilename();
		File f = new File(context.getRealPath("/")+"resources/Gimg/"+fileName);
		FileOutputStream fos = new FileOutputStream(f);
		fos.write(img.getBytes());
		fos.close();
		if(f.exists()) {
			result=true;
		}
		return result;
	}
}
