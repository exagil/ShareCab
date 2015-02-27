$(document).ready(function(){
  // Origin
  $("#origin").on('click', function(){
    if (!($('.map-canvas-origin').length)){ // origin map not present
      console.log("Origin Map Number: " + $('.map-canvas-origin').length);
      var mapCanvasOrigin = "<div class='map-canvas-origin'></div>";

      // get rid of all the material to be deleted
      $(".map-canvas-destination").remove();
      $("#bgvid").fadeOut(1000, function(){$(this).remove();});
      $(".middle-header").fadeOut(1000, function(){$(this).remove();});
      $(".one").prepend(mapCanvasOrigin).fadeIn(1000);
      $(".map-canvas-origin").fadeIn(1000);
    }
    else{ // origin map present
      $(".map-canvas-destination").remove();
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
      console.log("Destination Map Number: " + $('.map-canvas-destination').length);
      var mapCanvasDestination = "<div class='map-canvas-destination'></div>"
      // get rid of all the material to be deleted
      $('.map-canvas-origin').remove();
      $("#bgvid").fadeOut(1000, function(){$(this).remove();});
      $(".middle-header").fadeOut(1000, function(){$(this).remove();});
      $(".one").prepend(mapCanvasDestination).fadeIn(1000);
      $(".map-canvas-destination").fadeIn(1000);
    }
    else{ // destination map present
      $(".map-canvas-origin").remove();
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

//     var mapCanvasRoute = "<div id='map-route'></div>"
//     $("#date").focus(function(){
//     //passing values to origin_lat, origin_lng when clicked on date
//     $("#origin_lat").val($(".origin-lat").val());
//     $("#origin_lng").val($(".origin-lng").val());
//     $("#destination_lat").val($(".destination-lat").val());
//     $("#destination_lng").val($(".destination-lng").val());
//     $(".map-canvas-destination").remove();
//     $("#carousel-example-generic").remove();
//     $(".toggle-map").append(mapCanvasRoute);
//     $("#map-route").css( "display", "block" );
//   });

//   $("#date").change(function(){
    
//     //passing values to origin_lat, origin_lng when clicked on date
//     styles=

// [
//     {
//         "stylers": [
//             {
//                 "hue": "#dd0d0d"
//             }
//         ]
//     },
//     {
//         "featureType": "road",
//         "elementType": "labels",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "road",
//         "elementType": "geometry",
//         "stylers": [
//             {
//                 "lightness": 100
//             },
//             {
//                 "visibility": "simplified"
//             }
//         ]
//     }
// ];



//       var directionsDisplay;
//       var directionsService = new google.maps.DirectionsService();
//       var map;
//       // var contentString = "Lorem ipsum";

//       // var infowindow = new google.maps.InfoWindow({
//       //   // content:contentString
//       // });

//       // var marker;
//       function initialize() {
//       map = new google.maps.Map(document.getElementById('map-route'), {
//           zoom: 10,
//           // center: new google.maps.LatLng(-33.92, 151.25),
//           mapTypeId: google.maps.MapTypeId.ROADMAP
//       });

//       map.setOptions({styles: styles});
      
//       directionsDisplay = new google.maps.DirectionsRenderer();

//       directionsDisplay.setMap(map);

//       var start = new google.maps.LatLng($("#origin_lat").val(), $("#origin_lng").val());
//       var end = new google.maps.LatLng($("#destination_lat").val(), $("#destination_lng").val());
//       var request = {
//           origin: start,
//           destination: end,
//           travelMode: google.maps.DirectionsTravelMode.DRIVING
//       };
//       directionsService.route(request, function (response, status) {
//           if (status == google.maps.DirectionsStatus.OK) {
//               directionsDisplay.setDirections(response);
//           }
//       });
//       }
//       // google.maps.event.addDomListener(window, 'load', initialize);
  
//       // $('.map-canvas-destination').empty();
//       // alert("detects change");
//       initialize();

//       })


//   // Passing values to origin_lat and origin_lng on submit
  $("#find-button").on('click', function(){
    if ($('#origin_lat').is(':empty')){
    $("#origin_lat").val($(".origin-lat").val());
    $("#origin_lng").val($(".origin-lng").val());
    $("#destination_lat").val($(".destination-lat").val());
    $("#destination_lng").val($(".destination-lng").val());
  }
  });
// });

}); // end of doc