extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	var collisions = $KinematicBody2D.move_and_collide(Vector2(0,0))
	if collisions:
		frame = 12
