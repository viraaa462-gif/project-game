extends TextureButton

@export var target_scene : PackedScene
@export var amplitudo := 8.0
@export var kecepatan := 2.0

var waktu := 0.0
var posisi_awal_y := 0.0
var offset_random := 0.0


func _ready():

	await get_tree().process_frame

	posisi_awal_y = position.y

	offset_random = randf() * 10.0


func _on_button_down():
	scale = Vector2(0.9, 0.9)


func _on_button_up():
	scale = Vector2(1.0, 1.0)


func _pressed():

	if target_scene:
		get_tree().change_scene_to_packed(target_scene)


func _process(delta):

	waktu += delta

	position.y = posisi_awal_y + sin(
		(waktu + offset_random) * kecepatan
	) * amplitudo
