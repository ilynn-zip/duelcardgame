class_name Deck
extends Node2D

const CARD = preload("res://scenes/card.tscn")

@onready var cards_count: Label = $CardsCount
@onready var cards_case: Node2D = $CardsCase

@onready var cards_type : Array[int] = [2, 2, 2, 3, 3, 4, 5]
@onready var deck : Array[Vector2] = []  # x - type, y - number_type

func _ready() -> void:
	create_deck()
	shuffle_deck()
	instantiate_deck()
	remove_card(cards_case.get_child(0))
	
	cards_count.text = str(get_deck_size())

func create_deck():
	var count : int = 0
	for type in cards_type:
		for number in type:
			deck.append(Vector2(count, type))
		count += 1
		
func shuffle_deck():
	deck.shuffle()
	
func remove_card(card : Card) -> Vector2:
	cards_case.remove_child(card)
	cards_count.text = str(get_deck_size())
	return deck.pop_back()
	
func instantiate_deck():
	for card in deck:
		var card_instance = CARD.instantiate()
		card_instance.type = card.x
		card_instance.number = card.y
		cards_case.add_child(card_instance)
		
func get_deck_size() -> int:
	return cards_case.get_child_count()

func get_card(index: int = 0) -> Card:
	return cards_case.get_child(index)
