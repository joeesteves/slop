# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	ocultaOrigen()
	if ($('#op').val() == "nuevo" && $('#establecimientos').val() == null)
		alert("Su usuario no tiene ningún establecimiento asignado")
		window.history.back(-1)
	if($('#op').val() != "edit")
		$('#enviar').attr('disabled', 'disabled')
	$('#cantidad').keyup ->
		controlaCantidad()
	$('#cantidad').change ->
		controlaCantidad()
	$('#tipo_acc_id').change ->
		cambioSelAcc()
	$('#cat_ori').change ->
		if parseInt($('#codigoAcc').val()) > 11
			$('#category_id').val($('#cat_ori').val())
		cambioSelNoAcc()
	$('#category_id').change ->
		cambioSelNoAcc()
	$('#rodeo_id').change ->
		cambioSoloEstado()
	$('#rod_ori').change ->
		cambioSoloEstado()
		$('#rodeo_id').val($('#rod_ori').val())
	$('#est_ori').change ->
		cambioSoloEstado()
	$('#estado_id').change ->
		cambioSoloEstado()
	$('#movimiento_fecha_1i').change ->
		cambioSoloEstado()
	$('#movimiento_fecha_2i').change ->
		cambioSoloEstado()
	$('#movimiento_fecha_3i').change ->
		cambioSoloEstado()
	if $('#op').val() == 'edit'
		cambioSelAccEdit()
	$('#move').click ->
		$('#rpDisponibles .ui-selected').each ->
			$(this).appendTo($('#rpSeleccionados'))
		getSelected()
		$('#rpSeleccionados>div, #rpDisponibles>div').tsort()
	$("#moveBack").click ->
		$("#rpSeleccionados .ui-selected").each ->
			$(this).appendTo($('#rpDisponibles'))
		getSelected()
		$('#rpSeleccionados>div, #rpDisponibles>div').tsort()
cambioSelAcc = () ->
	$.ajax
		type: "POST"
		url: "../movimientos/sel"
		data:
			accion: 1
			est_ori: $('#est_ori').val()
			cat_ori: $('#cat_ori').val()
			rod_ori: $('#rod_ori').val()
			estado_id: $('#estado_id').val()
			category_id: $('#category_id').val()
			rodeo_id: $('#rodeo_id').val()
			tipo_acc_id: $('#tipo_acc_id').val()
			fecha: $('#fecha').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"
cambioSelAccEdit = () ->
	$.ajax
		type: "POST"
		url: "../movimientos/sel"
		data:
			edit: 1
			est_ori: $('#est_ori').val()
			cat_ori: $('#cat_ori').val()
			rod_ori: $('#rod_ori').val()
			estado_id: $('#estado_id').val()
			category_id: $('#category_id').val()
			rodeo_id: $('#rodeo_id').val()
			tipo_acc_id: $('#tipo_acc_id').val()
			fecha: $('#fecha').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"		
cambioSelNoAcc = () ->
	$.ajax
		type: "POST"
		url: "../movimientos/sel"
		data:
			est_ori: $('#est_ori').val()
			cat_ori: $('#cat_ori').val()
			rod_ori: $('#rod_ori').val()
			estado_id: $('#estado_id').val()
			category_id: $('#category_id').val()
			rodeo_id: $('#rodeo_id').val()
			tipo_acc_id: $('#tipo_acc_id').val()
			fecha: $('#fecha').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"		
cambioSoloEstado = () ->
	$.ajax
		type: "POST"
		url: "../movimientos/sel"
		data:
			soloEstado: 1
			est_ori: $('#est_ori').val()
			cat_ori: $('#cat_ori').val()
			rod_ori: $('#rod_ori').val()
			estado_id: $('#estado_id').val()
			category_id: $('#category_id').val()
			rodeo_id: $('#rodeo_id').val()
			tipo_acc_id: $('#tipo_acc_id').val()
			fecha: $('#fecha').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"
controlaCantidad = () ->	
	if ($('#accCrea').val() == '1')
		$('#enviar').removeAttr("disabled")
		$('#disponible').text('');
		$('#disp').val();
	else if ($('#cantidad').val() == '' || $('#cantidad').val() <= 0)
		$('#enviar').attr("disabled","disabled")
	else if (parseInt($('#disp').val()) >= $('#cantidad').val())
		$('#enviar').removeAttr("disabled")
	else	
		$('#enviar').attr("disabled","disabled")

muestraOrigen = () ->
	$('#catOrigen').show()
	$('#estOrigen').show()
	$('#rodOrigen').show()	
ocultaOrigen = () ->
	$('#catOrigen').hide()
	$('#estOrigen').hide()
	$('#rodOrigen').hide()
getSelected = () ->
	selectedElementsArr = new Array()
	$("#rpSeleccionados div").each ->
		selectedElementsArr.push($(this).text())
	$('#cantidad').val(selectedElementsArr.length)
