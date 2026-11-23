extends RichTextLabel

const LETRAS_POR_SEGUNDO := 30.0
const GLOSSARIO := {
	"sertao": "O [color=#f5e073]sertão[/color] é onde esta história começa.",
}

var _animacao: Tween


func _ready() -> void:
	falar("Cuidado com o [shake rate=20 level=8][color=#ff5a4a]dragão[/color][/shake] [wave amp=40 freq=5]encantado[/wave] do [url=sertao]sertão[/url].")


func falar(fala: String) -> void:
	text = fala
	visible_ratio = 0.0
	if _animacao:
		_animacao.kill()
	var duracao := get_total_character_count() / LETRAS_POR_SEGUNDO
	_animacao = create_tween()
	_animacao.tween_property(self, "visible_ratio", 1.0, duracao)


func _on_meta_clicked(meta: Variant) -> void:
	var chave := str(meta)
	if GLOSSARIO.has(chave):
		falar(GLOSSARIO[chave])
