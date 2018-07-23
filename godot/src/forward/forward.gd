extends Node

onready var math = preload("res://src/math/Math.tscn").instance()
var label

func feedForward():
	#input data
	var x = [[0,0,1], 
	[0,1,1], 
	[1,0,1], 
	[1,1,1]]

	var y = [[0], 
	[1], 
	[1], 
	[0]]

	#seed
	seed(1)


	#synapses
	#syn0 = 2*np.random.random((3,4)) - 1
	#syn1 = 2*np.random.random((4,1)) - 1
	#godot way
	var syn0 = []
	for i in range(3):
		syn0.append([])
		for j in range(4):
			syn0[i].append(-randf())

	var syn1 = []
	for i in range(3):
		syn1.append([])
		for j in range(1):
			syn1[i].append(-randf())

	var l0
	var l1
	var l2
	var l2_error
	var l2_delta
	var l1_error
	var l1_delta 

	#training
	for j in range(60000):
		#layers
		l0 = x
		l1 = nonlin(math.dot(l0, syn0))
		l2 = nonlin(math.dot(l1, syn1))

		#backpropogation
		l2_error = math.array_ard(y, math.array_mul(l2, -1)) # l2_error = y - l2
		if (j % 10000) == 0:
			print ('Error:' + str(math.mean(abs(l2_error))))

		#calcualte deltas
		l2_delta = l2_error * nonlin(l2, true)
		l1_error = math.dot(l2_delta, math.transpose2d(syn1))
		l1_delta = l1_error * nonlin(l1, true)

		#update our synapses (weights)
		syn1 += math.dot(math.transpose2d(l1), l2_delta)
		syn0 += math.dot(math.transpose2d(l0), l1_delta)

	print ("output after training")
	print (l2)


#sigmoid function
func nonlin(x, deriv=false):
	if(deriv):
		return (x*(1-x))
	return math.array_inv(math.array_add(math.array_exp(math.array_mul(x, -1)), 1))


