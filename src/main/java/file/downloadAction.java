package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadAction")
public class downloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
        // filename을 getParameter() 메서드로 얻어옴
		String fileName = request.getParameter("file");
		String directory = "C:/JSP/FileUpload/upload/";
		File file = new File(directory + "/" + fileName);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		// 오류가 발행하지 않도록 처리하는 부분, 2진데이터 전달시 octec-stream 사용
		if (mimeType == null) {
				response.setContentType("application/octect-stream");		
		}
		
		// 실제 다운로드 받을 이름
		String downloadName = null;
		if (request.getHeader("user-agent").indexOf("MSIE") == -1) {
				downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");

		} else {
				downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
				
		}
		
		response.setHeader("Content-Disposition", "attachment:filename=\"" + downloadName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		
		while ((data = (fileInputStream.read(b,0,b.length))) != -1) {
				servletOutputStream.write(b,0,data);
		}
		
		new FileDAO().hit(fileName);
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}
}
