extends Sprite

# Declare member variables here. Examples:
var speed = 8
var bulletRound = 1
var bullets
const bulletSpeed = 16
const ammoDelay = 0.2
var ammoDelta = ammoDelay

# Called when the node enters the scene tree for the first time.
func _ready():
	bullets = get_node("../bullets")
	print(bullets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_D):
		frame = 0
		position.x += speed
	if Input.is_key_pressed(KEY_A):
		frame = 2
		position.x -= speed
	if Input.is_key_pressed(KEY_W):
		frame = 3
		position.y -= speed
	if Input.is_key_pressed(KEY_S):
		frame = 1
		position.y += speed

	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

	ammoDelta += delta
	if ammoDelta > ammoDelay and Input.is_mouse_button_pressed(1):
		var b = bullets.get_child(bulletRound)
		b.position = position
		b.velocity = (get_global_mouse_position() - position).normalized() * bulletSpeed
		bulletRound += 1
		bulletRound %= bullets.get_child_count()
		ammoDelta = 0
