extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var bullet = get_node("bullet")
	for i in range(50):
		var dupe = bullet.duplicate()
		dupe.name = "bullet" + str(i)
		add_child(dupe)
