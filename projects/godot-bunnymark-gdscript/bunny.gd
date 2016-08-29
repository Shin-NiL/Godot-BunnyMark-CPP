
extends Sprite

var velocity = Vector2(0, 0)
var gravity = 3
var max_x = 640
var min_x = 0
var max_y = 480
var min_y = 0


func _ready():
	var tex = preload("res://wabbit_alpha.png")
	set_texture(tex)
	velocity.x = randf() * 10
	velocity.y = rand_range(5, 10)
	set_process(true)
	
func _process(delta):
	var pos = get_pos()

	pos.x += velocity.x
	pos.y += velocity.y
	velocity.y += gravity
		
	if (pos.x > max_x):
		velocity.x *= -1
		pos.x = max_x
	elif (pos.x < min_x):
		velocity.x *= -1
		pos.x = min_x
		
	if (pos.y > max_y):
		velocity.y *= -0.8
		pos.y = max_y
		if (randf() > 0.5):
			velocity.y -= randf() * 12;
		 
	elif (pos.y < min_y):
		velocity.y = 0;
		pos.y = min_y;
		
	set_pos(pos)



