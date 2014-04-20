var do_on_load = function() { 
    $('#search_category').hide();
    $('#search_mode').change(function () {
      if(search_mode.value == '2')
      {
          $('#search_category').show();
      }
      else if(search_mode.value == '1')
      {
         $('#search_category').hide();
      }
    })
}
$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);