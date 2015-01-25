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


  // Passing values to origin_lat and origin_lng
  $("#find").on('click', function(){
    $("#origin_lat").val($(".origin-lat").val());
    $("#origin_lng").val($(".origin-lng").val());
    $("#destination_lat").val($(".destination-lat").val());
    $("#destination_lng").val($(".destination-lng").val());
  });
});
