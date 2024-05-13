document.addEventListener('turbolinks:load', function(event) {
    if (typeof gtag === 'function') {
      gtag('config', 'G-9XEPNVH670', {
        'page_location': event.data.url
      });
    }
  });

