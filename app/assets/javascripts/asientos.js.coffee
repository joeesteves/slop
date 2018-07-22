$(document).ready ->
	if $('#action').val() == "index"
		sumDebe = 0
		sumHaber = 0
		$(".debe").each -> 
			if !isNaN(parseFloat($(this).text()))
				sumDebe += parseFloat( $(this).text())
		$("#totalDebe").text(sumDebe.toFixed(2))
		$(".haber").each -> 
			if !isNaN(parseFloat($(this).text()))
				sumHaber += parseFloat( $(this).text())
		$("#totalHaber").text(sumHaber.toFixed(2))
		sumSaldo = (sumDebe - sumHaber).toFixed(2)
		$("#totalSaldo").text(sumSaldo)
	else 
		sumImporte = 0
		$(".importe").each -> 
			if !isNaN(parseFloat($(this).text()))
				sumImporte += parseFloat( $(this).text())
		$("#totalSaldo").text(sumImporte)

