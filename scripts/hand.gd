extends Node3D

const CARD = preload("res://scenes/card.tscn")

func draw_card(amount: int = 1):
	for c in amount:
		var card = CARD.instantiate()
		self.add_child(card)
