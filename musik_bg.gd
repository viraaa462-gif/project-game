extends Node

var player : AudioStreamPlayer
var is_muted = false

func _ready():
	player = AudioStreamPlayer.new()
	add_child(player)

	player.stream = preload("res://audio/musik.ogg")
	player.bus = "Master"
	player.autoplay = true
	player.volume_db = 0
	player.play()

func _process(delta):
	if player and not player.playing:
		player.play()

func toggle_music():
	is_muted = !is_muted
	
	if player == null:
		return
	
	if is_muted:
		player.volume_db = -80
	else:
		player.volume_db = 0

func set_volume(nilai):
	if player != null:
		player.volume_db = nilai
