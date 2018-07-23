extends Node2D

onready var network = preload("res://src/network/Network.tscn").instance()
onready var forward = preload("res://src/forward/Forward.tscn").instance()
#onready var math = preload("res://src/math/Math.tscn").instance()

func _ready():
	print("main ready!")
	network.prop(0)
	add_child(network)
	
	add_child(forward)
	forward.feedForward()

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
