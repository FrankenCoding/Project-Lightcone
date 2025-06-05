extends Node

class_name DeckManager

const YamlLoader = preload("res://scripts/YamlLoader.gd")
const Card = preload("res://scripts/Card.gd")

var draw_pile: Array = []
var discard_pile: Array = []
var card_scene := preload("res://scenes/cards/Card.tscn")

func load_from_yaml(path: String) -> void:
    var data = YamlLoader.load_yaml(path)
    for entry in data:
        var card: Card = card_scene.instantiate()
        card.from_dict(entry)
        draw_pile.append(card)
    draw_pile.shuffle()

func draw_cards(amount: int) -> Array:
    var cards = []
    for i in range(amount):
        if draw_pile.size() == 0:
            shuffle_discard_into_draw()
            if draw_pile.size() == 0:
                break
        cards.append(draw_pile.pop_back())
    return cards

func shuffle_discard_into_draw():
    draw_pile = discard_pile
    discard_pile = []
    draw_pile.shuffle()
