extends Node2D

var healthkit = preload("res://healthkit.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var newhealthkit = healthkit.instantiate()
	add_child(newhealthkit)
	var spawnpos = randi_range(0,get_window().content_scale_size.x)
	newhealthkit.position.y = spawnpos
	print("health spawned")
