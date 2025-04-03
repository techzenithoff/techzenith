/* -----------------------------------------------
/* How to use? : Check the GitHub README
/* ----------------------------------------------- */

/* To load a config file (particles.json) you need to host this demo (MAMP/WAMP/local)... */
/*
particlesJS.load('particles-js', 'particles.json', function() {
  console.log('particles.js loaded - callback');
});
*/

/* Otherwise just put the config content (json): */
$(document).on('turbolinks:load', function() {  

  if ($("#particles-js").length > 0) {
            particlesJS.load('particles-js', import("../vendor/frontend/tekup/assets/js/particlesjs/particles.json"));
        }

});