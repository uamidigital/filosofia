var map = L.map('map').setView([19.361753, -99.073395], 16);

L.tileLayer('http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);


  $("main").removeClass("col-xs-12 col-sm-10 col-md-8");

  $(document).ready(function() {
    //Set the carousel options
    $('#quote-carousel').carousel({
      pause: true,
      interval: 4000,
    });
  });



  $('#det div a').click(function(e){
    console.log('holiwis');
    $('#det div a').removeClass('active');
    var $parent = $(this).parent();
    $parent.addClass('active');
    e.preventDefault();
  });