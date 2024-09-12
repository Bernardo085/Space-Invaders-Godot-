extends Node2D

var ufo_shot_scene = preload("res://Screens/invader_shoot.tscn")
@onready var spawn_timer = $SpawnTimer

func _ready():
	(spawn_timer as SpawnTimer).setup_timer()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var ufo_shot = ufo_shot_scene.instantiate()
	var ufo_shot_sprite = ufo_shot.get_node("Sprite2D") as Sprite2D
	ufo_shot_sprite.modulate = Color(0.62,0.2,0.2, 1)
	ufo_shot.globa_position = global_position
	get_tree().root.add_child(ufo_shot)
	(spawn_timer as SpawnTimer).setup_timer()
