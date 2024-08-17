extends CanvasLayer

@onready var textbox_container = $TextBoxContainer
@onready var start_symbol = $TextBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/HBoxContainer2/Start
@onready var label = $TextBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/HBoxContainer2/Label
@onready var end_symbol = $TextBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/HBoxContainer3/End
@onready var letter_display_timer = $LetterDisplayTimer
@onready var Voice_name = $TextBoxContainer/MarginContainer2/MarginContainer/VBoxContainer/HBoxContainer/Name

@onready var audio_player = $AudioStreamPlayer

var letter_time = 0.03
var ponctuation_time = 0.1
var dot_time = 0.3
var space_time = 0.01
var text = ""
var letter_index = 0

signal finished_displaying

func _ready():
	hide_textbox()

func hide_textbox():
	start_symbol.text = ""
	end_symbol.visible = false
	label.text = ""
	textbox_container.hide()

func show_textbox(speaker_name: String):
	start_symbol.text = "*"
	Voice_name.text = speaker_name  # Define o nome do falante corretamente
	textbox_container.show()

func add_text(next_text: String, speech_sfx: AudioStream, speaker_name: String):
	text = next_text
	label.text = text  # Definir o texto no Label
	
	audio_player.stream = speech_sfx
	label.visible_characters = 0  # Definir 0 caracteres visíveis
	letter_index = 0
	print("Speaker Name: ", speaker_name)  # Depuração
	Voice_name.text = speaker_name
	show_textbox(speaker_name)  # Passa o nome do falante para `show_textbox`
	_display_letter()

func _display_letter():
	if letter_index < text.length():
		label.visible_characters = letter_index + 1  # Incrementar caracteres visíveis
		letter_index += 1
		
		# Adicionar a lógica específica para tempos de exibição de caracteres
		var current_char = text[letter_index - 1]  # Verifique o caractere atual
		match current_char:
			"!", ",", "?":
				letter_display_timer.start(ponctuation_time)
			".":
				letter_display_timer.start(dot_time)
			" ":
				letter_display_timer.start(space_time)
			_:
				letter_display_timer.start(letter_time)
		
		# Reproduzir o som a cada letra
		if audio_player.stream:
			if audio_player.is_playing():
				audio_player.stop()
			audio_player.play()

	else:
		end_symbol.visible = true
		emit_signal("finished_displaying")

func _on_letter_display_timer_timeout():
	_display_letter()
