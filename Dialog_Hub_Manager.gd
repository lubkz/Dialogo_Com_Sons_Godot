extends Node

@export var text_box_scene: PackedScene = preload("res://Scenes/HUB_text_box.tscn")
var dialog_entries: Array[Dictionary] = []
var text_box = null
var current_line_index = 0
var sfx: AudioStream
var speaker_name: String = ""

var is_dialog_active = false
var can_advance_line = false

var trocar_dialogo = true

signal dialog_finished

func start_dialog(entries: Array[Dictionary]):
	if is_dialog_active:
		return
	
	dialog_entries = entries
	current_line_index = 0
	is_dialog_active = true
	_show_text_box()

func _show_text_box():
	var entry = dialog_entries[current_line_index]
	sfx = entry.get("Voice", "null")
	speaker_name = entry.get("Name", "")
	
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	add_child(text_box)
	
	var line = entry.get("Line", "")
	print(line)
	text_box.add_text(line, sfx, speaker_name)
	can_advance_line = false

func _on_text_box_finished_displaying():
	can_advance_line = true

func _input(event):
	if event.is_action_pressed("Advance line") and is_dialog_active and can_advance_line:
		text_box.queue_free()
		current_line_index += 1
		if current_line_index >= dialog_entries.size() and trocar_dialogo:
			is_dialog_active = false
			current_line_index = 0
			emit_signal("dialog_finished")
			return
		_show_text_box()  # Passa o nome do falante atualizado
