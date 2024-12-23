extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	var sprint_multiplier = 1
	if Input.is_action_pressed("move_sprint"):
		sprint_multiplier = 2
	if direction:
		velocity.x = direction * SPEED * sprint_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
