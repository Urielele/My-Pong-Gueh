extends CharacterBody2D

var win_size: Vector2
const start_speed: int = 500
const accel: int = 70
var speed: int
var dir: Vector2

func _ready() -> void:
	win_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var collision =move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		
		if collider is Player or collider is CPU:
			speed += accel
			dir = dir.bounce(collision.get_normal())
		else:
			dir = dir.bounce(collision.get_normal())

func new_ball():
	
	position.x = win_size.x / 2
	position.y = randi_range(200 ,win_size.y - 200)
	speed = start_speed
	dir = random_direction()

func random_direction():
	var new_dir: = Vector2.ZERO
	new_dir.x = [1,-1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()

#func new_direction(collider):
	#var ball_y = position.y
	#var pad_y  = collider.position.y
	#var dist = ball_y - pad_y
	#var new_dir := Vector2.ZERO
	#
	#if dir.x > 0:
		#new_dir.x = -1
	#else:
		#new_dir.x = 1
	#new_dir.y = (dist / (collider.p_height / 2))
