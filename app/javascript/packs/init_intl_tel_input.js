
$(document).on('turbolinks:load', function() {
	try{
		$("#phone").intlTelInput({
		    formatOnInit: true,
		    formatOnDisplay: true,
		    separateDialCode: true,
		    preferredCountries: ['ml'],
		    utilsScript: require("../vendor/backend/bracket/lib/intl-tel-input/build/js/utils.js"),
		    //utilsScript: reauire("../vendor/bracket/lib/libphonenumber/utils.js"),
		    
	  	});
  	} catch (e) {

  }
});



$(document).on('turbolinks:load', function() {
  $('body').on('shown.bs.modal', '.modal', function() {
    try{
    $("#phone").intlTelInput({
        formatOnInit: true,
        formatOnDisplay: true,
        separateDialCode: true,
        preferredCountries: ['ml'],
        utilsScript: require("../vendor/backend/bracket/lib/intl-tel-input/build/js/utils.js"),
        //utilsScript: reauire("../vendor/bracket/lib/libphonenumber/utils.js"),
        
      });
    } catch (e) {

  }
  });
});