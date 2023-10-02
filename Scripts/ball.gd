extends RigidBody3D

@export var _texture : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_material := StandardMaterial3D.new()
	new_material.albedo_texture = _texture
	$BallMesh.material_override = new_material


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
