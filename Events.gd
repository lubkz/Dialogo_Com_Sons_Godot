extends Node2D

var fade_speed : float = 0.5
var in_monologo = true

@onready var color_rect = $Monologo/ColorRect
var Girl_voice = preload("res://Speech_sounds/Voice_grill.wav")
var void_voice = preload("res://Speech_sounds/Void1.wav")
@onready var audio_stream_player = $"../AudioStreamPlayer"
@onready var fear_music = $Fear_music

# Called when the node enters the scene tree for the first time.
func _ready():
	var Girl_voice = preload("res://Speech_sounds/Voice_grill.wav")
	var void_voice = preload("res://Speech_sounds/Void1.wav")
	
	var dialog_entries: Array[Dictionary] = [
		{"Line": "Eu consigo.", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Dessa vez... eu vou conseguir!", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Eu... eu vou enfrentar esses malditos.", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Como se fosse um jogo de Rpg!", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Claro!", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Irei derrotar todos os meus inimigos.", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Passarei por todos os desafios, pois...", "Voice": Girl_voice, "Name": "Girl" },
		{"Line": "Eu sou uma cavaleira!", "Voice": Girl_voice, "Name": "Girl" },
]
	DialogHubManager.start_dialog(dialog_entries)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not DialogHubManager.is_dialog_active:
		if audio_stream_player and color_rect:
			audio_stream_player.play()
			if color_rect.modulate.a > 0:
				color_rect.modulate.a -= fade_speed * delta
			else:
				queue_free()  # Remove o CanvasLayer quando o fade-out estiver 


# Parte finalfunc _on_box_dialogs_8_body_entered(body):
#	audio_stream_player.stop()
#	fear_music.play()
