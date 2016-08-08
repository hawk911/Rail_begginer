$(document).ready(function() {
  $('.search_form').submit(function() {

    var beginStation = $(this).find('#from');
    var endStation = $(this).find('#to');

    if ( beginStation.val() == endStation.val() ) {
      alert('Выберите конечную станцию');
      return false;
    }
  });
});
