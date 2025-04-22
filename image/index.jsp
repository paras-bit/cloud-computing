<%@page import="java.io.*"%>
<%@page import="javax.xml.ws.soap.MTOMFeature"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MTOM File Upload & Download</title>
</head>
<body>
<h2>MTOM File Upload & Download</h2>
<%-- Upload File --%>
<%
try {
mypkg.ImageWS_Service service = new mypkg.ImageWS_Service();
mypkg.ImageWS port = service.getImageWSPort(new MTOMFeature(60000));
String filePath = "D:\\TYCS\\TYCS-SEM6\\Cloud-Computing\\flower.JPG";
File file = new File(filePath);
FileInputStream fis = new FileInputStream(file);
BufferedInputStream bis = new BufferedInputStream(fis);
String filename = file.getName();
byte[] imageBytes = new byte[(int) file.length()];
bis.read(imageBytes);
port.upload(filename, imageBytes);
bis.close();
out.println("<p>File uploaded: " + filePath + "</p>");
} catch (Exception ex) {
out.println("<p>Error: " + ex.getMessage() + "</p>");
}
%>
<%-- Download File --%>
<%
try {
mypkg.ImageWS_Service service = new mypkg.ImageWS_Service();
mypkg.ImageWS port = service.getImageWSPort();
String filename = "flower.JPG";
String filePath = "D:\\TYCS\\TYCS-SEM6\\Cloud-Computing\\download\\"+ filename;
byte[] fileBytes = port.download(filename);
FileOutputStream fos = new FileOutputStream(filePath);
BufferedOutputStream bos = new BufferedOutputStream(fos);
bos.write(fileBytes);
bos.close();
out.println("<p>File downloaded to: " + filePath + "</p>");
} catch (Exception ex) {
out.println("<p>Error: " + ex.getMessage() + "</p>");
}
%>
</body>
</html>
