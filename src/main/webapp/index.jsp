<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP File Upload Page</title>
</head>
<body>

	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="file1"><br>
		<input type="file" name="file2"><br>
		<input type="file" name="file3"><br>
		<P><input type="submit" value="업로드"><br></P>
	</form>
	<a href="fileDownload.jsp">Download page</a>
</body>
</html>