class_name Card extends Node2D

@export_range(0.0, 6.0, 1.0) var type : int = 0
@export_range(2.0, 5.0, 1.0) var number : int = 2

@onready var type_label: Label = $TypeLabel
@onready var number_label: Label = $NumberLabel

@onready var card_offset : int = -1

func _ready() -> void:
	number_label.text = str(number)
	type_label.text = str(type)
	
func set_card_offset(amount : int):
	if card_offset == -1:
		card_offset = amount
	$Sprite2D.set_z_index(amount)


func _on_mouse_entered() -> void:
	set_card_offset(30)
	self.scale *= 1.2

func _on_mouse_exited() -> void:
	set_card_offset(card_offset)
	self.scale /= 1.2
