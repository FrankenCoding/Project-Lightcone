extends Node

class_name Card

var id: String = ""
var name: String = ""
var type: String = ""
var cost: int = 0
var risk_on_play: int = 0

# Optional fields depending on card type
var compute_per_turn: int = 0
var insight_per_turn: int = 0
var agi_on_play: int = 0
var draw_cards: int = 0
var description: String = ""

# Whether this card stays in play between turns
var persistent: bool = false

func from_dict(data: Dictionary) -> void:
    id = data.get("id", "")
    name = data.get("name", "")
    type = data.get("type", "")
    cost = int(data.get("cost", 0))
    risk_on_play = int(data.get("risk_on_play", 0))
    compute_per_turn = int(data.get("compute_per_turn", 0))
    insight_per_turn = int(data.get("insight_per_turn", 0))
    agi_on_play = int(data.get("agi_on_play", 0))
    draw_cards = int(data.get("draw_cards", 0))
    description = data.get("description", "")
    persistent = data.get("persistent", false)


func play():
    pass
