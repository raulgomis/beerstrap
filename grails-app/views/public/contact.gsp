<%@ page contentType="text/html"%>
<html>
<head>
        <meta name="layout" content="public" />
        <parameter name="menu_Contact" value="active" />
        <title>Contact</title>
</head>
<body>


    <h2 class="section_header">
        <span><i class="fa fa-phone-square"></i> Contact <small> See all plan details here</small>
        </span>
        <hr class="right visible-desktop">
    </h2>

    <div class="row">
        <div class="col-md-4">
            <address>
                <h3>Alicante, Spain</h3>
                <i class="fa fa-map-marker"></i> 795 Folsom Ave, Suite 600<br>
                San Francisco, CA 94107<br>
                <i class="fa fa-phone"></i> (123) 456-7890<br>
            </address>
        </div>
        <div class="col-md-4">
            <address>
                <h3>San Francisco, USA</h3>
                <i class="fa fa-map-marker"></i> 795 Folsom Ave, Suite 600<br>
                San Francisco, CA 94107<br>
                <i class="fa fa-phone"></i> (123) 456-7890<br>
            </address>
        </div>
        <div class="col-md-4">

            <address>
                <h3>London, UK</h3>
                <i class="fa fa-map-marker"></i> 795 Folsom Ave, Suite 600<br>
                London, UK 94107<br>
                <i class="fa fa-phone"></i> (123) 456-7890<br>
            </address>
        </div>
    </div>

<div id="map_canvas" style="width: 100%; height: 400px"></div>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
    var markers = [
        ['Alicante, Spain', 38.345203, -0.481006],
        ['San Francisco, USA', 37.77493, -122.419415],
        ['London, UK', 51.500152, -0.126236]
    ];

    function initializeMaps() {
        var myOptions = {
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            mapTypeControl: false
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
        var infowindow = new google.maps.InfoWindow();
        var marker, i;
        var bounds = new google.maps.LatLngBounds();

        for (i = 0; i < markers.length; i++) {
            var pos = new google.maps.LatLng(markers[i][1], markers[i][2]);
            bounds.extend(pos);
            marker = new google.maps.Marker({
                position: pos,
                map: map
            });
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(markers[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));
        }
        map.fitBounds(bounds);
    }
    initializeMaps();
</script>

</body>
</html>