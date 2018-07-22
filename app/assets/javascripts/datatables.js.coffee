$(document).ready ->
	$('table:not(.notDT)').dataTable
	  "sDom": '<"row"<"small-2 columns"l><"small-4 small-offset-6 columns"f>><"row"<"small-12 columns"t>><"row"<"small-12 columns"ip>><"row"<"small-12 columns"T>>'
	  "oTableTools":
	  	"aButtons":[
		  	"sExtends":     "copy"
		  	"sButtonText": "COPIAR"
		  	{"sExtends":     "csv"
		  	"sButtonText": "CSV"}
		  	{"sExtends":     "print"
		  	"sButtonText": "IMPRIMIR"}
		  	{"sExtends":     "xls"
		  	"sButtonText": "EXCEL"}
		  	{"sExtends":     "pdf"
		  	"sButtonText": "PDF"}]
	  "sPaginationType": "full_numbers"
	  "oLanguage":
    	"oPaginate":
      	"sFirst": "<<"
      	"sLast":">>"
      	"sNext":">"
      	"sPrevious":"<"
     	"sSearch": "Buscar"
      "sInfoEmpty": "Ningún registro coincide con su busqueda"
      "sZeroRecords": "Ningún registro coincide con su busqueda"
      "sEmptyTable": "Ningún registro coincide con su busqueda"
      "sInfoFiltered": " - Buscando entre _MAX_ registros"
      "sInfo": "Registros totales: _TOTAL_ - mostrando (_START_ to _END_)"
      "sLengthMenu": "Mostrar <select><option value='20'>20</option><option value='50'>50</option><option value='100'>100</option></select>"
	$('.groupDT').dataTable
		"sDom": '<"row"<"small-2 columns"l><"small-4 small-offset-6 columns"f>><"row"<"small-12 columns"t>><"row"<"small-12 columns"ip>><"row"<"small-12 columns"T>>'
		"bLengthChange": false
		"bPaginate": false
		"oLanguage":
			"sSearch": "Buscar"
			"sInfoEmpty": "Ningún registro coincide con su busqueda"
			"sZeroRecords": "Ningún registro coincide con su busqueda"
			"sEmptyTable": "Ningún registro coincide con su busqueda"
			"sInfoFiltered": " - Buscando entre _MAX_ registros"
			"sInfo": "Registros totales: _TOTAL_ - mostrando (_START_ to _END_)"
	.rowGrouping
		bExpandableGrouping: true
		asExpandedGroups: ["TOTALES"]		
