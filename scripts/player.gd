extends CharacterBody2D
@onready var anim = $AnimatedSprite2D



const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		anim.play("jump")
		velocity += get_gravity() * delta
		
	if is_on_floor():
		anim.play("idle")
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")

		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor() && velocity.y == 0:
			$AnimatedSprite2D.play("walk")
			#flip the animation to the right or left
			$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if $AnimatedSprite2D.animation == "walk":
			$AnimatedSprite2D.stop()

	move_and_slide()
