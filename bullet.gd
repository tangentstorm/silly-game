extends Sprite

# Declare member variables here. Examples:
var velocity = Vector2(0,0)

func _process(delta):
	position += velocity
