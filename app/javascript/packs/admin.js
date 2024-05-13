require("./application");

import "../stylesheets/admin.scss";
//require("../vendor/backend/adminkit-dev/static/js/app");
//require("../vendor/backend/velonic_v6.0.0/admin/dist/assets/js/app.min");



import 'datatables.net'
import 'datatables.net-bs';
//import 'datatables.net-responsive-bs';



//import "chartkick/highcharts"

//import 'bootstrap/dist/js/bootstrap'
import "@fortawesome/fontawesome-free/css/all";
//import '@fortawesome/fontawesome-free';



// DATATABLES

/* LAST IMPORT */
//require("../vendor/bracket/lib/datatables.net-dt/js/dataTables.dataTables.min")
//require("../vendor/bracket/lib/datatables.net/js/jquery.dataTables.min")

//require("../vendor/bracket/lib/datatables.net-responsive/js/dataTables.responsive.min")
//require("../vendor/bracket/lib/datatables.net-responsive-dt/js/responsive.dataTables.min")

require("../vendor/backend/bracket/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min")
require("../vendor/backend/bracket/lib/DataTables/Responsive-2.5.0/js/dataTables.responsive.min")
//require("../vendor/bracket/lib/DataTables/Buttons-2.4.2/js/buttons.dataTables.min")
//require("../vendor/bracket/lib/DataTables/Responsive-2.5.0/js/responsive.bootstrap.min")


// BRACKET TEMPLATE JS
require("../vendor/backend/bracket/lib/jquery-ui/ui/widgets/datepicker")
//import "../vendor/bracket/lib/bootstrap/js/bootstrap.bundle.min";
//import PerfectScrollbar from "../vendor/bracket/lib/perfect-scrollbar/perfect-scrollbar.min";
//window.PerfectScrollbar = PerfectScrollbar;
//import "../vendor/bracket/lib/moment/min/moment.min";
//import "../vendor/bracket/lib/peity/jquery.peity.min";
//import "../vendor/bracket/lib/rickshaw/vendor/d3.min;";
//import "../vendor/bracket/lib/rickshaw/vendor/d3.layout.min";
//import "../vendor/bracket/lib/rickshaw/rickshaw.min";
//import "../vendor/bracket/lib/jquery.flot/jquery.flot";
//import "../vendor/bracket/lib/jquery.flot/jquery.flot.resize";
//import "../vendor/bracket/lib/flot-spline/js/jquery.flot.spline.min";
//import "../vendor/bracket/lib/jquery-sparkline/jquery.sparkline.min";
//import "../vendor/bracket/lib/echarts/echarts.min";
require("../vendor/backend/bracket/lib/select2/js/select2.full.min");


require("../vendor/backend/bracket/lib/bootstrap/js/bootstrap.bundle.min");
require("../vendor/backend/bracket/js/bracket");
require("../vendor/backend/bracket/js/ResizeSensor");
//require("../vendor/bracket/js/dashboard")

require("./init_datatables")
require("./init_select2")
//require("./init_intl_tel_input")
//require("./social-share-button")
//require("./cookieconsent_init")
