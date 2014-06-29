// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require vendor/jquery-1.9.1.min.js
//= require jquery_ujs
//= require vendor/bootstrap.min.js
//= require vendor/modernizr-2.6.2-respond-1.1.0.min
//= require waypoints.min.js
//= require waypoints-sticky.js
//= require jquery.cycle2.min.js
//= require jquery.cycle2.scrollVert.min.js
//= require jquery.scrollto.js
//= require grid.js


$(document).on('ajax:before', '#new_notification', function(e){
  $(e.target).find('.loader').addClass('in').find('.bar').width('40%')
});

$(document).on('ajax:complete', "#new_notification", function(e, xhr){
  var $data = $(xhr.responseText);
  $data.find('.loader').addClass('in');
  $data.replaceAll(e.target).find('.bar').width('100%').one($.support.transition.end, function(e){
    $data.find('.loader').removeClass('in');
    $data.find('.bar').width('0');
  });
});

$(function() {

  $('#slider').cycle({
    fx : 'scrollVert',
    timeout: 3000,
    speed: 300,
    slides: '.slide'
  });

  $('.navbar').waypoint('sticky');

  $('.navbar a, a.scrollto, a#arrow_down').click(function(e){
    $('html,body').scrollTo(this.hash, this.hash);
    e.preventDefault();
  });

  Grid.init();
});
