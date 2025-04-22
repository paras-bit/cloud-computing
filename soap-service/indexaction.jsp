<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Temperature Converter</title>
</head>
<body>
<%
mypackage.TemperatureWebService ob = new mypackage.TemperatureWebService();
double temp = Double.parseDouble(request.getParameter("t1"));
float result1 = ob. ConvertCtoF (temp);
float result2 = ob. ConvertFtoC(temp);
out.println("temperature in Fahrenheit : "+result1);
out.println("temperature in celcius : "+result2);
%>
</body>
</html>
