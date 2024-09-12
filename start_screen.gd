extends CanvasLayer

@onready var inimigo_1 = %Inimigo1
@onready var score_1 = %Score1
@onready var inimigo_2 = %Inimigo2
@onready var score_2 = %Score2
@onready var inimigo_3 = %Inimigo3
@onready var score_3 = %Score3
@onready var timer = $Timer
var control_array = [] 

func _ready():
	control_array = [inimigo_1, inimigo_2, inimigo_3, score_1, score_2, score_3]
	for control in control_array:
		(control as Control).visible = false 

func _on_timer_timeout():
	var control = control_array.pop_front() as Control
	if control != null:
		control.visible = true
	else:
		timer.stop()
		timer.queue_free()
		
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Screens/main.tscn")
