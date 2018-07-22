// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.tabs
//= require jquery.ui.selectable
//= require jquery_ujs
//= require foundation
//= require_tree
//= require dataTables/jquery.dataTables
//= require dataTables/extras/TableTools
//= require dataTables/extras/ZeroClipboard
//= require chosen-jquery
//= require tinymce-jquery

$(function(){
	$(this).keyup(function(e) {
			e.preventDefault();
			e.stopPropagation();
			if(e.ctrlKey && e.shiftKey && e.keyCode==65){
			$(location).attr('href',$('#new_controller_path').val())}
});
	$('input:checkbox').keyup(function(e) {
		e.preventDefault();
		e.stopPropagation();
		if(e.keyCode==32){
			if ($(this).prop('checked') == true){
				$(this).prop('checked', false);}
			else{
				$(this).prop('checked', true);
			}
		}
	});
	$('select').chosen({width: "100%"});
	$('#establecimientos').change(function(){	
		cambioEst();
	});
$('#empresas').change(function(){	
	cambioEmp();
});


});

function cambioEst(){
$.ajax({
	global: false,
	type: "POST",
	url: "/sessions/cambioEst",
	data: {establecimiento_id: $('#establecimientos').val()},
 	dataType: "script"
	});
};

function cambioEmp(){
$.ajax({
	global: false,
	type: "POST",
	url: "/sessions/cambioEmp",
	data: {empresa_id: $('#empresas').val()},
	dataType: "script",
});
};

$(function(){ $(document).foundation(); });
