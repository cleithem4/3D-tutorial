class_name Ball
extends RigidBody3D

@export var _texture : Texture2D

const BALL_RADIUS := 0.027
const BALL_DIAMETER := BALL_RADIUS * 2


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_new_material()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_ball(ball_num,ball_x,ball_z):
	self.position.x = ball_x
	self.position.z = ball_z
	
	_texture = load("res://Assets/uploads_files_4287169_Billiard+Table/Ball Textures/" + str(ball_num) + ".jpg")

func apply_new_material():
	var new_material := StandardMaterial3D.new()
	new_material.albedo_texture = _texture
	$BallMesh.material_override = new_material
