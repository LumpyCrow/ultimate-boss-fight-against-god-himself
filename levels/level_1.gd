extends Node2D

@onready var button = get_node("Button")
var buttondown = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not $AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play()
	
	if button.buttondown == true:
		if $door.position.y > 668:
			$door.position.y = $door.position.y - 1
			if not $doorsound.is_playing():
				$doorsound.play()
	if button.buttondown == false:
		if $door.position.y < 716:
			if not $doorsound.is_playing():
				$doorsound.play()
			$door.position.y = $door.position.y + 1


func _on_tranition_to_next_level_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://level_2_boss_arena.tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$player.visible = true
	$Flyright.visible = false
	$Controlpad2.visible = false
	$Label.visible = true
	$Rightbutton.visible = true
	
