extends Node3D

@export var _cue_ball : RigidBody3D
@export var _aim_container : Node3D
@export var _cue_stick : Node3D
@export var _animation_Player : AnimationPlayer
@export var overheadCam : Camera3D
@export var _billiard_table : Node3D

@export var _stick_min_z := 0
@export var _stick_max_z := 0.55
@export var _stick_sens := 0.01
@export var _shot_power_max := 5.0
@export var _shot_power_min := 0.1
var _shot_percent := 0.0

var HEAD_SPOT = Vector3(-1.257,0.39,0)
var FOOT_SPOT = Vector3(-0.215,0.39,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	_cue_ball.position = HEAD_SPOT
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_handle_shot_input()
	_aim_container.position = _cue_ball.position

		

func _input(event):
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		_aim_container.rotation_degrees.y += mouse_motion.relative.x
		_cue_stick.position.z += mouse_motion.relative.y * _stick_sens
		_cue_stick.position.z = clamp(_cue_stick.position.z,_stick_min_z,_stick_max_z)
		_shot_percent += mouse_motion.relative.y * _stick_sens
		_shot_percent = clamp(_shot_percent,0,1)
func _handle_shot_input():
	if Input.is_action_just_pressed("shoot"):
		#var impulse_vector = Vector3(1,0,0)
		_animation_Player.play("pool_stick_shoot")
func strike_ball():
	var _shot_power = 0.0
	var stick_direction = -_aim_container.basis.z
	_shot_power = lerp(_shot_power_min,_shot_power_max,_shot_percent)
	var shot_vector = _shot_power * stick_direction
	_cue_ball.apply_central_impulse(shot_vector)
	overheadCam.current = true
