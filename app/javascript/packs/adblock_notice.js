$(document).on('turbolinks:load', function() {
	async function detectAdBlock() {

		let adBlockEnabled = false;
		const currentUrl = window.location.href;
		

  	const googleAdUrl = 'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js';
	  try {
	    await fetch(new Request(googleAdUrl)).catch(_ => adBlockEnabled = true)
	  } catch (e) {
	    adBlockEnabled = true;
	    if (adBlockEnabled == true ){
	  		//window.location.href= currentUrl+"adblock-notice";
	  		window.location.href= "adblock-notice";
	  	}
	  } finally {
	  	
	    //console.log(`AdBlock Enabled: ${adBlockEnabled}`)
	  }
	}
	detectAdBlock();
});

// CREDITS: https://jonathanmh.com/how-to-detect-ad-blockers-adblock-ublock-etc/
//window.addEventListener("load", () => {
 // fetch(
    //"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js",
    // "https://www3.doubleclick.net",
    // "https://static.ads-twitter.com/uwt.js"
   // { method: "HEAD", mode: "no-cors", cache: "no-store" }
  //)
  //.then(res => alert("ADS ALLOWED"))
  //.catch(err => alert("ADBLOCK DETECTED"));
//});