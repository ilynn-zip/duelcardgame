@tool
extends Node3D

@export var hand_radius : float = 5
@export var hand_position : Vector3 = Vector3(0, -6, -2)
@export var card_angle : float = 90
@export var angle_limit : float = 45
@export var spread_angle : float = 10

@onready var card_case: Node3D = $CardsCase
@onready var draw_marker: Marker3D = $DrawMarker
@onready var deck : Node3D = get_parent().get_parent().get_node("Deck")


func _ready() -> void:
	self.position = hand_position

func _process(delta: float) -> void:
	#debug
	#set_cards_postion()
	#self.position = hand_position
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tap"):
		draw_card()

func draw_card(amount: int = 1):
	if deck.get_deck_size() > 0:
		var card = deck.get_card()
		deck.remove_card(card)
		card_case.add_child(card)
		card.set_postion(draw_marker.position)
		cards_reposition()

func remove_card():
	pass

func cards_reposition():
	var hand_size : int = card_case.get_child_count()
	var card_spread : float = min(angle_limit / hand_size, spread_angle)
	var current_angle : float = (card_spread * (hand_size - 1)) / 2 + 90
	for card in card_case.get_children():
		_update_card_transform(card, current_angle)
		current_angle -= card_spread

func _update_card_transform(card : Node3D, angle : float):
	card.set_position(get_card_position(angle))
	card.set_rotation(Vector3(card.rotation.x, card.rotation.y, deg_to_rad(angle - 90)))

func get_card_position(angle : float) -> Vector3:
	var x : float = hand_radius * cos(deg_to_rad(angle))
	var y : float = hand_radius * sin(deg_to_rad(angle))
	
	return Vector3(x, y, 0)

func sort_cards():
	pass
