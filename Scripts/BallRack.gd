extends Node3D


@export var _ball_tscn : PackedScene


func _ready():
	rack_balls()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func rack_balls():
	const DIAMETER = Ball.BALL_DIAMETER
	const RADIUS = Ball.BALL_RADIUS
	
	
	var ball_nums = range(1,16)
	ball_nums.shuffle()
	var ball_i = 0
	for i in 5:
		for j in i+1:
			var new_ball = _ball_tscn.instantiate() as Ball
			var ball_x := i* DIAMETER * 0.9
			var ball_z := (i * RADIUS) - (j*DIAMETER)
			new_ball.setup_ball(ball_nums[ball_i],ball_x,ball_z)
			ball_i += 1
			self.add_child(new_ball)
