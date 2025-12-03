extends CharacterBody2D

@export_category("movement variable")
@export var move_speed = 120.0
@export var deceleration = 0.1
@export var gravity = 500.0
var movement = Vector2()

@export_category("jump variable")
@export var jump_speed = 190.0
@export var acceleration = 290.0
@export var max_jumps = 2
var jump_count = 0


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	horizontal_movement()
	jump_logic()
	set_animation()
	flip()
	
	move_and_slide()


func horizontal_movement():
	movement = Input.get_axis("ui_left", "ui_right")
	
	if movement:
		velocity.x = movement * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed * deceleration)


func set_animation():
	if velocity.x != 0:
		$anim.play("move")
	else:
		$anim.play("idle")


func flip():
	if velocity.x > 0.0:
		scale.x = scale.y * 1
	elif velocity.x < 0.0:
		scale.x = scale.y * -1


# -------------------------
# FIXED DOUBLE JUMP LOGIC
# -------------------------
func jump_logic():
	# Auf dem Boden zurücksetzen
	if is_on_floor():
		jump_count = 0

	# Sprung drücken → erster oder zweiter Sprung
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		jump_count += 1
		velocity.y = -lerp(jump_speed, acceleration, 0.1)

	# Optional: kürzerer Sprung falls Taste losgelassen wird
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= 0.5
