
const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// Get the actual sass-loader config
//const sassLoader = environment.loaders.get('sass')
//const sassLoaderConfig = sassLoader.use.find(function(element) {
  //return element.loader == 'sass-loader'
//})


environment.plugins.append('Provide', new webpack.ProvidePlugin({
	$: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
	Popper: ['popper.js', 'default'],
  //pdfjsLib: 'pdfjs-dist/es5/build/pdf',
  //pdfjsWorker: 'pdfjs-dist/es5/build/pdf.worker'
  //pdfjsWorker: 'worker-loader?esModule=false&filename=[name].js!pdfjs-dist/es5/build/pdf.worker'

}));
//environment.loaders.delete('nodeModules') // <== deletes Webpacker loader rule for node_modules
module.exports = environment


/*
const { environment } = require('@rails/webpacker')
const webpack = require("webpack")
environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  }))
module.exports = environment
*/
/*
, new webpack.ProvidePlugin({
    pdfjsLib: 'pdfjs-dist/build/pdf',
    pdfjsWorker: 'worker-loader?esModule=false&filename=[name].js!pdfjs-dist/build/pdf.worker'
  })*/