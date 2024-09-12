extends Area2D

class_name Ufo
@onready var ufo_shooting = $UfoShooting
@onready var sprite_2d = $Sprite2D
var ufo_explosion = preload("res://Assets Space Invades/Ufo/Ufo-explosion.png")
var speed = 200

func _process(delta):
	position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is Laser:
		ufo_shooting.queue_free()
		speed = 0
		sprite_2d.texture = ufo_explosion
		await get_tree().create_timer(1).timeout
		queue_free()
