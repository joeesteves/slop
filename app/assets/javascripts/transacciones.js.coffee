$(document).ready ->
	root = $('#root').val()
	$('#grisar').hide()
	$(document).ajaxStart ->
		$('body').css('cursor', 'wait')
		$('#grisar').show()
	$(document).ajaxSuccess ->
		$('body').css('cursor', 'auto')
		$('#grisar').hide()
	if $('#esCierre').val() == "1"
		buscaCuotasCierre()
	if $('#accion').val() == 'edit' || $('#accion').val() == 'new'
		dibujaPantalla(root)
		$('#divApp').hide()
	$('#aplicaciones').change ->
		buscaImporte()
	$('#transaccion_transacciontipo_id').change ->
		dibujaPantalla(root)
		buscaCuentas()
	$('#transaccion_ctaD_id').change ->
		if $('#codigo').val() == "4"
			buscaCuotas()
	$('#transaccion_ctaH_id').change ->
		if $('#codigo').val() == "3"
			buscaCuotas()
	$('#transaccion_importe').change ->
		calculaCuota()
		if $('#transaccion_civa').val() == "true"
			ivaReverso()
		else
			$('#transaccion_bruto').val($('#transaccion_importe').val())
	$('#transaccion_cuotascantidad').change ->
		calculaCuota()
	$('#valorCuota').change ->
		calculaImporte()
		$('#transaccion_importe').change()
	if $('#aplicaciones').val() != null && $('#accion').val() == 'new'
		buscaImporte()
	$('#botonAplicar').click ->
		$('#popAplicaciones').foundation('reveal', 'close')
	$('#codigo').change ->
		buscaCuotas()
	habilitaIva()
	$('#transaccion_civa').change ->
		habilitaIva()
	$(this).keyup (e) ->
		e.preventDefault()
		e.stopPropagation()
		if(e.ctrlKey && e.shiftKey && e.keyCode==70)
			$('#popAplicaciones').foundation('reveal', 'open')
			$('#filtro').foundation('reveal', 'open')
			$('#fecha').focus()
calculaCuota = () ->
	res = $('#transaccion_importe').val() / $('#transaccion_cuotascantidad').val()
	resFix = res.toFixed(2)
	$('#valorCuota').val(resFix)

calculaImporte = () ->
	$('#transaccion_importe').val($('#valorCuota').val() * $('#transaccion_cuotascantidad').val())

buscaImporte = () ->
	$.ajax
		type: "POST"
		url: "../cuotas/importe"
		data:
			cuotas: $('#aplicaciones').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"

buscaCuentas = () ->
	$.ajax
		type: "POST"
		url: "../cuentas/filtraPorTipos"
		data:
			transaccion_id: $('#transaccion_transacciontipo_id').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"

buscaCuotas = () ->
	$.ajax
		type: "POST"
		url: "../cuotas/buscaCuotas"
		data:
			transacciontipo_id: $('#transaccion_transacciontipo_id').val()
			ctaD: $('#transaccion_ctaD_id').val()
			ctaH: $('#transaccion_ctaH_id').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"

buscaCuotasCierre = () ->
	$.ajax
		type: "POST"
		url: "../cuotas/buscaCuotas"
		data:
			esCierre: "1"
			transacciontipo_id: $('#transaccion_transacciontipo_id').val()
			ctaD: $('#transaccion_ctaD_id').val()
			ctaH: $('#transaccion_ctaH_id').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"

dibujaPantalla = (root) ->
	$.ajax
		type: "POST"
		url: root + "transaccion/dibujaPantalla"
		data:
			transacciontipo_id: $('#transaccion_transacciontipo_id').val()
			authenticity_token: $("[name='authenticity_token']").val()
		dataType: "script"
habilitaIva = () ->
	if $('#transaccion_civa').val() == "false"
		$('#transaccion_iva').attr("disabled", "disabled")
		$('#transaccion_bruto').attr("readonly", true)
		$('#transaccion_bruto').removeAttr("tabindex")
		importe = $('#transaccion_importe').val()
		$('#transaccion_bruto').val(importe)
		$('#transaccion_iva').val("")
	else
		$('#transaccion_iva').removeAttr("disabled")
		$('#transaccion_bruto').removeAttr("readonly")
		$('#transaccion_bruto').attr("tabindex", "5")
		$('#transaccion_bruto').change ->
			bruto = $('#transaccion_bruto').val()
			$('#transaccion_iva').val(bruto * 0.21)
			iva = $('#transaccion_iva').val()
			$('#transaccion_importe').val(parseFloat(bruto)+ parseFloat(iva))
			calculaCuota()
		$('#transaccion_iva').change ->
			bruto = $('#transaccion_bruto').val()
			iva = $('#transaccion_iva').val()
			$('#transaccion_importe').val(parseFloat(bruto)+ parseFloat(iva))
			calculaCuota()
ivaReverso = () ->
	importe = $('#transaccion_importe').val()
	$('#transaccion_iva').val((importe * 21 /121).toFixed(2))
	$('#transaccion_bruto').val((importe * 100 /121).toFixed(2))
