extends Node

var resource = load("res://dialogues/nat-llegada.dialogue")

func _ready():
	DialogueManager.show_dialogue_balloon(resource)
