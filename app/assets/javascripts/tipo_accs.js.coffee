$(document).ready ->
	if $('#tipo_acc_codigo').val() == "" || $('#tipo_acc_codigo').val() < 10 && $('#tipo_acc_codigo').val() != '2' && $('#tipo_acc_codigo').val() != '0'
		$('#divEstadoOri').hide();
	$('#tipo_acc_codigo').change ->
		if $('#tipo_acc_codigo').val() == '2'  || $('#tipo_acc_codigo').val() > 10 || $('#tipo_acc_codigo').val() == 0
			$('#divEstadoOri').show();
		else
			$('#divEstadoOri').hide();	
