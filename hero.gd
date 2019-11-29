extends Sprite

# Declare member variables here. Examples:
var speed = 8
var bulletRound = 1
var bullets
const bulletSpeed = 16
const ammoDelay = 0.08
var ammoDelta = ammoDelay

# Called when the node enters the scene tree for the first time.
func _ready():
	bullets = get_node("../bullets")
	print(bullets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_D): position.x += speed
	if Input.is_key_pressed(KEY_A): position.x -= speed
	if Input.is_key_pressed(KEY_W): position.y -= speed
	if Input.is_key_pressed(KEY_S): position.y += speed
	
	ammoDelta += delta
	if ammoDelta > ammoDelay and Input.is_mouse_button_pressed(1):
		var b = bullets.get_child(bulletRound)
		b.position = position
		b.velocity = (get_global_mouse_position() - position).normalized() * bulletSpeed
		bulletRound += 1
		bulletRound %= bullets.get_child_count()
		ammoDelta = 0
