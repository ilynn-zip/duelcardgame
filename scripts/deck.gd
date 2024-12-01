extends Node3D

@export var v_spacing : float = 0.05

const CARD = preload("res://scenes/card.tscn")

@onready var cards_type : Array[int] = [2, 2, 2, 3, 3, 4, 5]
@onready var deck : Array[Node3D] = []

func _ready() -> void:
	create_deck()
	shuffle_deck()
	remove_card()
	instantiate_deck()

func instantiate_deck():
	for card in deck:
		self.add_child(card)

func create_deck():
	var type : int = 0
	for count in cards_type:
		for number in count:
			var card = CARD.instantiate()
			card.type = type
			card.number = count
			card.position.z = type * v_spacing
			deck.append(card)
		type += 1

func shuffle_deck():
	deck.shuffle()
	
func remove_card():
	deck.pop_back()
