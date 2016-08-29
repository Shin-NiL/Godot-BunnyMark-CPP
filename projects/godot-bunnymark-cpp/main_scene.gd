extends Node2D

export var num_bunnies = 250

var update_fps_timer
var total_bunnies = 0

func _ready():
	randomize()
	add_bunnies(num_bunnies, 0, 0)
	
	update_fps_timer = Timer.new()
	update_fps_timer.set_wait_time(1)
	update_fps_timer.connect("timeout", self, "_update_fps_label")
	update_fps_timer.set_autostart(true)
	add_child(update_fps_timer)

	set_process_input(true)

func _update_fps_label():
	get_node("gui_layer/fps_label").set_text("FPS: " + str(OS.get_frames_per_second()))
	get_node("gui_layer/count_label").set_text("COUNT: " + str(total_bunnies))
	
	
func add_bunnies(amount, x, y):
	var bunny
	for i in range(amount):
		bunny = Bunny.new()
		bunny.set_pos(Vector2(x, y))
		add_child(bunny)
		total_bunnies += 1
	get_node("gui_layer/count_label").set_text("COUNT: " + str(total_bunnies))

func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH:
		if event.pressed:
			add_bunnies(250, event.x, event.y)
