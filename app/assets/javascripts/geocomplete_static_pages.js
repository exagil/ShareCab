
$(document).ready(function(){
  // Origin
  $("#origin").on('click', function(){
    if (!($('.map-canvas-origin').length)){ // origin map not present
      console.log("Origin Map: " + $('.map-canvas-origin').length);
      $(".map-canvas-destination").remove();
      $("#carousel-example-generic").remove();
      var mapCanvasOrigin = "<div class='map-canvas-origin'></div>"
      $(".toggle-map").append(mapCanvasOrigin);
    }
    else{ // origin map present
      $(".map-canvas-destination").remove();
      $("#carousel-example-generic").remove();
      // var mapCanvasOrigin = "<div class='map-canvas'></div>"
      // $(".toggle-map").append(mapCanvasOrigin);
    }

    $(this).geocomplete({
      map: ".map-canvas-origin",
      details: ".fill-origin",
      markerOptions: {
        draggable: true
      }
    });

    // $("#find").click(function(){
    //   $("#geocomplete").trigger("geocode");
    // });

    $(this).bind("geocode:dragged", function(event, latLng){
      $(".origin-lat").val(latLng.lat());
      $(".origin-lng").val(latLng.lng());
    });

  }); // end of origin


  // Destination
  $("#destination").on('click', function(){
    if (!($('.map-canvas-destination').length)){ // destination map not present
      $("#carousel-example-generic").remove();
      $('.map-canvas-origin').remove();
      var mapCanvasDestination = "<div class='map-canvas-destination'></div>"
      $(".toggle-map").append(mapCanvasDestination);
    }
    else{ // destination map present
      $(".map-canvas-origin").remove();
      $("#carousel-example-generic").remove();
      // var mapCanvasOrigin = "<div class='map-canvas'></div>"
      // $(".toggle-map").append(mapCanvasOrigin);
    }

    $(this).geocomplete({
      map: ".map-canvas-destination",
      details: ".fill-destination",
      markerOptions: {
        draggable: true
      }
    });

    // $("#find").click(function(){
    //   $("#geocomplete").trigger("geocode");
    // });

    $(this).bind("geocode:dragged", function(event, latLng){
      $(".destination-lat").val(latLng.lat());
      $(".destination-lng").val(latLng.lng());
    });
  }); // end of destination   

    $("#date").focus(function(){
    //passing values to origin_lat, origin_lng when clicked on date
    $("#origin_lat").val($(".origin-lat").val());
    $("#origin_lng").val($(".origin-lng").val());
    $("#destination_lat").val($(".destination-lat").val());
    $("#destination_lng").val($(".destination-lng").val());
  });

  $("#date").on('click', function(){
    //passing values to origin_lat, origin_lng when clicked on date
    styles=

[
    {
        "stylers": [
            {
                "hue": "#dd0d0d"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 100
            },
            {
                "visibility": "simplified"
            }
        ]
    }
];



      var directionsDisplay;
      var directionsService = new google.maps.DirectionsService();
      var map;
      // var contentString = "Lorem ipsum";

      // var infowindow = new google.maps.InfoWindow({
      //   // content:contentString
      // });

      // var marker;
      function initialize() {
      map = new google.maps.Map(document.getElementById('map-canvas-destination')[0], {
          zoom: 10,
          // center: new google.maps.LatLng(-33.92, 151.25),
          mapTypeId: google.maps.MapTypeId.ROADMAP
      });

      map.setOptions({styles: styles});
      
      directionsDisplay = new google.maps.DirectionsRenderer();

      directionsDisplay.setMap(map);

      var start = new google.maps.LatLng($("#origin-lat").val(), $("#origin-lng").val());
      var end = new google.maps.LatLng($("#destination-lat").val(), $("#destination-lng").val());
      var request = {
          origin: start,
          destination: end,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
      };
      directionsService.route(request, function (response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
              directionsDisplay.setDirections(response);
          }
      });
      }
      // google.maps.event.addDomListener(window, 'load', initialize);
      $('.map-canvas-destination').empty();
      initialize();

      })


  // Passing values to origin_lat and origin_lng on submit
  $("#find-pal").on('click', function(){
    if ($('#origin_lat').is(':empty')){
    $("#origin_lat").val($(".origin-lat").val());
    $("#origin_lng").val($(".origin-lng").val());
    $("#destination_lat").val($(".destination-lat").val());
    $("#destination_lng").val($(".destination-lng").val());
  }
  });
});
