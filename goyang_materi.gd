extends TextureButton

@export var target_scene : PackedScene
@export var amplitudo = 5
@export var kecepatan = 2

var waktu = 0.0
var posisi_awal
var offset_random

func _ready():
	posisi_awal = position
	offset_random = randf() * 10.0

func _process(delta):
	waktu += delta
	position.y = posisi_awal.y + sin((waktu + offset_random) * kecepatan) * amplitudo

# Saat tombol ditekan
func _on_button_down():
	scale = Vector2(0.9, 0.9)

# Saat dilepas
func _on_button_up():
	scale = Vector2(1, 1)
	
func _pressed():
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
