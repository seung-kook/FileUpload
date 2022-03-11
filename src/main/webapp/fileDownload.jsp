<%@ page import="file.FileDAO" %>
<%@ page import="file.FileDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>File Download page</title>
</head>
<body>
<%
   ArrayList<FileDTO> fileList = new FileDAO().getList();
	
   for (FileDTO file : fileList) {
	out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" + 
	java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">" + 
			file.getFileName() + "(Download HIT: " + file.getDownloadCount() + ")</a><br>");
	}
%>
</body>
</html>