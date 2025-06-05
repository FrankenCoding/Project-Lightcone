extends Node

const DeckManager = preload("res://scripts/DeckManager.gd")
const TurnManager = preload("res://scripts/TurnManager.gd")

@onready var deck_manager: DeckManager = $DeckManager
@onready var turn_manager: TurnManager = $TurnManager

func _ready():
    deck_manager.load_from_yaml("res://data/cards.yaml")
    turn_manager.compute = 3
    start_new_turn()

func start_new_turn():
    turn_manager.start_turn()
    var hand = deck_manager.draw_cards(5)
    # For demo purposes, just print the drawn card names
    for c in hand:
        print("Drew ", c.name)
