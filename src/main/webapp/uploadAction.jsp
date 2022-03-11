<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File upload page</title>
</head>
<body>
	<%
		String directory = "C:/jsp/fileupload/upload/";
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);

			if(fileName == null) continue;
			if(!fileName.endsWith(".doc") && !fileName.endsWith(".docx") &&
					!fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") && 
					!fileName.endsWith(".xls") && !fileName.endsWith(".xlsx") && 
					!fileName.endsWith(".jpg")) {
				File file = new File(directory + fileRealName);
				file.delete();
				out.write("업로드할 수 없는 확장자 입니다.");
			} else {
				new FileDAO().upload(fileName, fileRealName);
				out.write("파일명: " + fileName + "<br>");
				out.write("실제 파일명: " + fileRealName + "<br>");
			}
        }
	%>
</body>
</html>