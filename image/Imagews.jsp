package mypkg;
import java.io.*;
import javax.jws.Oneway;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.soap.MTOM;
@MTOM(enabled=true, threshold=60000)
@WebService(serviceName = "ImageWS")
public class ImageWS {
@WebMethod(operationName = "upload")
@Oneway
public void upload(@WebParam(name = "Filename") String Filename, @WebParam(name =
"ImageBytes") byte[] ImageBytes) {
String filePath = "D:/TYCS/TYCS-SEM6/Cloud-Computing/upload/" + Filename;
try {
FileOutputStream fos = new FileOutputStream(filePath);
BufferedOutputStream bos = new BufferedOutputStream(fos);
bos.write(ImageBytes);
bos.close();
System.out.println("Received file: " + filePath);
} catch (Exception ex) {
System.out.println(ex);
}
}
@WebMethod(operationName = "download")
public byte[] download(@WebParam(name = "Filename") String Filename) {
String filePath = "D:/TYCS/TYCS-SEM6/Cloud-Computing/upload/" + Filename;
System.out.println("Sending file: " + filePath);
try {
File file = new File(filePath);
FileInputStream fis = new FileInputStream(file);
BufferedInputStream bis = new BufferedInputStream(fis);
byte[] fileBytes = new byte[(int) file.length()];
bis.read(fileBytes);
bis.close();
return fileBytes;
} catch (Exception ex) {
System.out.println(ex);
}
return null;
}
}
