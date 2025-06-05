extends Node

class_name TurnManager

const Card = preload("res://scripts/Card.gd")

var actions_left := 3
var compute := 0
var insight := 0
var risk := 0
var agi := 0

var researchers: Array = []
var hardware: Array = []

signal turn_started
signal turn_ended

func start_turn():
    actions_left = 3
    emit_signal("turn_started")

func end_turn():
    emit_signal("turn_ended")

func play_card(card: Card) -> bool:
    if compute < card.cost:
        return false
    compute -= card.cost
    risk += card.risk_on_play
    match card.type:
        "researcher":
            researchers.append(card)
            card.persistent = true
        "hardware":
            hardware.append(card)
            card.persistent = true
        "algorithm":
            agi += card.agi_on_play
        "dataset":
            var drawn = get_node("../DeckManager").draw_cards(card.draw_cards)
            # In a full game these would be added to the hand
        "governance":
            risk = max(risk + card.risk_on_play, 0)
        "event":
            insight += card.insight_per_turn
    actions_left -= 1
    return true

func maintenance_phase():
    for r in researchers:
        insight += r.insight_per_turn
    for h in hardware:
        compute += h.compute_per_turn
    if risk >= 10:
        print("Run ended: Rogue AI")
