extends Node

@onready var bird = $"../Bird" as Bird
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner
@onready var ground = $"../Ground" as Ground
@onready var fade = $"../Fade" as Fade
@onready var ui = $"../UI" as Ui
@onready var music = $"../Music"

var points = 0

func _ready():
	music.pitch_scale = 0.01
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)
	
func on_game_started():
	var tween = get_tree().create_tween()
	tween.tween_property(music, "pitch_scale", 1.0, 1)
	pipe_spawner.start_spawning_pipes()

func end_game():
	var tween = get_tree().create_tween()
	tween.tween_property(music, "pitch_scale", 0.0, 1)
	
	if fade != null :
		fade.play()
	ground.stop()
	bird.kill()
	pipe_spawner.stop()
	ui.on_game_over()
	
func on_point_scored():
	points += 1
	ui.update_points(points)
