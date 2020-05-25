tool
extends HBoxContainer

export var items: PoolStringArray = ["placeholder1", "placeholder2"]

var _carousel_index: int = 0
var selected_value := "" setget set_selected_value


func _ready() -> void:
	$Previous.connect("pressed", self, "_on_Previous_value")
	$Next.connect("pressed", self, "_on_Next_value")

	selected_value = items[0]
	$Value.text = items[0]


func _process(delta: float) -> void:
	if not Engine.editor_hint:
		return
	$Value.text = items[0]


func _on_Previous_value() -> void:
	_carousel_index -= 1

	if _carousel_index < 0:
		_carousel_index = items.size() - 1

	self.selected_value = items[_carousel_index]


func _on_Next_value() -> void:
	_carousel_index += 1

	if _carousel_index >= items.size():
		_carousel_index = 0

	self.selected_value = items[_carousel_index]


func set_selected_value(text: String) -> void:
	selected_value = text
	$Value.text = text