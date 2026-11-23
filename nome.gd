extends VBoxContainer


func _on_entrada_text_changed(entrada: String) -> void:
	$Cru.text = entrada
	$Seguro.text = escapar(entrada)


func escapar(entrada: String) -> String:
	return entrada.replace("[", "[lb]")
