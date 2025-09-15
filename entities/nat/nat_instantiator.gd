extends Marker2D
## Manage nat instantiation in a level.

@export var nat_scene: PackedScene ## Reference to the nat scene.
@export_range(1, 4) var player_id := 1 ## Nat is a player

@onready var parent = get_parent()

func _ready() -> void:
	_instantiate_nat.call_deferred()

func _instantiate_nat():
	var nat: NatEntity = nat_scene.instantiate() as NatEntity
	if nat:
		nat.player_id = player_id
		nat.global_position = global_position
		parent.add_child.call_deferred(nat)
		Globals.player_added_to_scene.emit(nat)
	queue_free()
