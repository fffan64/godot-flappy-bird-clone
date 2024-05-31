extends CanvasLayer

class_name Ui

@onready var points_label = $MarginContainer/PointsLabel
@onready var game_over_box = $MarginContainer/GameOverBox
@onready var click_sfx = $ClickSFX

func _ready():
	points_label.text = "%d" % 0
	
func update_points(points: int):
	points_label.text = "%d" % points
	
func on_game_over():
	game_over_box.visible = true
	


func _on_button_pressed():
	click_sfx.play()
	await click_sfx.finished
	get_tree().reload_current_scene()
