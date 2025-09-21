extends CharacterBody2D


const SPEED = 10.0
const JUMP_VELOCITY = -400.0
var isAttacking = false


func _ready():
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("right") and isAttacking == false:
		$".".position.x += SPEED
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.scale.x = 2
		$attackcollision/CollisionShape2D.position.x = 82
	elif Input.is_action_pressed("left") and isAttacking == false:
		$".".position.x -= SPEED
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.scale.x = -2
		$attackcollision/CollisionShape2D.position.x = -37
	else:
		if isAttacking == false:
			$AnimatedSprite2D.play("default")
	
	if Input.is_action_just_pressed("attack") and isAttacking == false:
		$AnimatedSprite2D.play("attack")
		$attackcollision/CollisionShape2D.disabled = false
		isAttacking = true
	
	
	
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "attack":
		$attackcollision/CollisionShape2D.disabled = true
		isAttacking = false
