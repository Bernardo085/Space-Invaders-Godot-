extends Area2D

class_name Player

var speed = 200
var direcao = Vector2.ZERO
@onready var collistion_react: CollisionShape2D = $CollisionShape2D
@onready var animation_player = $AnimationPlayer
var bounding_size_x 
var start_bound
var end_bound
func _ready():
	bounding_size_x = collistion_react.shape.get_rect().size.x
	var rect = get_viewport().get_visible_rect()
	var camera  = get_viewport().get_camera_2d() 
	var camera_position = camera.position
	start_bound = (camera.position.x - rect.size.x)/ 2
	end_bound = (camera.position.x + rect.size.x)/ 2

func _process(delta):
	var input = Input.get_axis("move_left",'move_right')
	if input > 0:
		direcao = Vector2.RIGHT
	elif input < 0:
		direcao = Vector2.LEFT
	else: 
		direcao = Vector2.ZERO	
	
	var delta_movement = direcao.x * speed * delta
	
	if(position.x + delta_movement < start_bound + bounding_size_x * transform.get_scale().x ||
	position.x + delta_movement > end_bound - bounding_size_x * transform.get_scale().x):
		return
	position.x += delta_movement

func on_player_destroyed():
	speed = 0
	animation_player.play("Destroy")

