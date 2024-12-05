class_name Card extends StaticBody3D

@export_range(0.0, 6.0, 1.0) var type : int = 0
@export_range(2.0, 5.0, 1.0) var number : int = 2

@onready var type_label: Label3D = $TypeLabel
@onready var number_label: Label3D = $NumberLabel

func _ready() -> void:
	number_label.text = str(number)
	type_label.text = str(type)
