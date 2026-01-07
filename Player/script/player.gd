extends CharacterBody2D

@export_category("movement variable")
@export var move_speed = 120.0
@export var deceleration = 0.1
@export var gravity = 500.0
var movement = Vector2()

@export_category("jump viriable")
@export var jump_speed = 190.0
@export var acceleration = 290.0
@export var jump_amount = 2

@export_category("Wall jump variable")
@export var wall_slide = 10
@onready var left_ray: RayCast2D = $raycast/left_ray
@onready var right_ray: RayCast2D = $raycast/right_ray
@export var wall_x_force =200.0
@export var wall_y_force = -220.0
var is_wall_jumping =false

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	horizontal_movement()
	jump_logic()
	set_animation()
	flip()
	wall_logic()
	
	move_and_slide()

func horizontal_movement():
	if is_wall_jumping == false:
		movement = Input.get_axis("ui_left", "ui_right")
	
	if movement:
		velocity.x = movement * move_speed
	else:
			velocity.x = move_toward(velocity.x, 0, move_speed * deceleration)
			
func set_animation():
	if velocity.x != 0:
		$anim.play("move")
	if velocity.x == 0:
		$anim.play("idle")
	if velocity.y < 0:
		$anim.play("Jump")
	if velocity.y > 10:
		$anim.play("Fall")
	if is_on_wall_only():
		$anim.play("Fall")

func flip():
	if velocity.x > 0.0:
		scale.x = scale.y * 1
		wall_x_force = 200.0
	if velocity.x < 0.0:
		scale.x = scale.y * -1
		wall_x_force = -200.0

func jump_logic():
	if is_on_floor():
		jump_amount = 2
	
	if Input.is_action_just_pressed("ui_accept"):
		jump_amount -= 1
		velocity.y -= lerp(jump_speed, acceleration, 0.1)
		velocity.y = 0.3		
		
	else:
		return
		
func wall_logic():
	if is_on_wall_only(): 
		var _wall_slide_speed = 60.0
		if velocity.y >  _wall_slide_speed:
			velocity.y = _wall_slide_speed
		
		
		
		if Input.is_action_just_pressed("ui_accept"):
			if left_ray.is_colliding():
				velocity = Vector2(wall_x_force, wall_y_force)
				wall_jumping()
			if right_ray.is_colliding():
				jump_amount = 2 
				velocity = Vector2(-wall_x_force, wall_y_force)
				wall_jumping()
				
func wall_jumping():
	is_wall_jumping = true
	await get_tree().create_timer(0.12).timeout
	is_wall_jumping = false
				
