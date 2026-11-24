extends Node2D

const SPEED := 140.0

@onready var wick: Node2D = $Wick
@onready var anim: AnimationPlayer = $Wick/AnimationPlayer
@onready var label: Label = $UI/Label


func _ready() -> void:
	anim.play("idle")


func _process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")

	if direction != 0.0:
		wick.position.x += direction * SPEED * delta
		wick.scale.x = absf(wick.scale.x) * signf(direction)
		play_animation("walk")
	else:
		play_animation("idle")

	wick.position.x = clampf(wick.position.x, 80.0, 1072.0)
	label.text = "Hold Arrow keys or A/D to walk\nCurrent animation: " + anim.current_animation


func play_animation(anim_name: String) -> void:
	if anim.current_animation != anim_name:
		anim.play(anim_name, 0.2)
