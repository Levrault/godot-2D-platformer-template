# Find data to save inside the current menu (should by child or Contents)
extends Button
class_name MenuSaveButton

export var section := ''
onready var _fields_container := owner.find_node("Contents").get_children()


func _ready() -> void:
	connect("pressed", self, "_on_Pressed")
	assert(section != "")


func _get_fields() -> Dictionary:
	var data := {}
	for container in _fields_container:
		for field in container.get_children():
			if field.is_in_group("GameSettings"):
				data[field.key] = field.selected_value
	return data


func _on_Pressed() -> void:
	Config.values[section] = _get_fields()
	Config.save(Config.values)