<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#map {
height: 400px;
width: 100%;
}
</style>
</head>
<body>
<%
double lati = Double.parseDouble(request.getParameter("t1"));
double longi = Double.parseDouble(request.getParameter("t2"));
%>
<h3> Google Maps </h3>
<div id="map"></div>
<script lang="javascript">
function initMap() {
var info = {lat: <%=lati%>, lng: <%=longi%>};
var map = new
google.maps.Map(document.getElementById('map'), {
zoom: 4, center: info
});
var marker = new google.maps.Marker({
position: info, map: map
});
}
</script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABDGOtSq_aRldB9nq
8RAINq24fb2wRPps&callback=initMap">
</script>
</body>
</html>
