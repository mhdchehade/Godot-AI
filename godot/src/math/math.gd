extends Node


# this class is dedicated for all math functions that are not included in godot

# perform a matrix transpose assuming the input is a valid matrix
# it support multiple matrix types
# TODO add error handling
func transpose2d(m):
	var t = []
	for i in range(m[0].size()):
		t.append([])
		for j in range(m.size()):
			t[i].append(m[j][i])
	return t

# perform a matrix dot product assuming m1 and m2 are m x n and n x p
# it support multiple matrix types
# TODO add error handling
func dot(m1, m2):
	print('to dot ', m1, ' and ', m2)
	var dot = []
	var mt = transpose2d(m1)
	
	var mul
	for i in range(m1[0].size()):
		dot.append([])
		mul = m2[i]
		for j in range(m2.size()):
			var x = mul[0] * 0
			for k in range(mul.size()):
				x += mul[k] * mt[j][k]
			dot[i].append( x )
	
	return dot

func mean(mat):
	var mean = 0
	var n = 0
	
	if typeof(mat[0]) == TYPE_DICTIONARY or typeof(mat[0]) == TYPE_ARRAY:
		for i in range(mat.size()):
			for j in range(mat[0].size()):
				n += 1
				mean += mat[i][j]
	
	else:
		for i in range(mat.size()):
			n += 1
			mean += mat[i]
	
	mean = mean / n
	
	return mean

func array_exp(array):
	if typeof(array[0]) == TYPE_DICTIONARY or typeof(array[0]) == TYPE_ARRAY:
		for i in range(array.size()):
			for j in range(array[0].size()):
				array[i][j] = exp(array[i][j])
		return array
	else:
		for i in range(array.size()):
			array[i] = exp(array[i])
		return array

func array_mul(array, value):
	print(' to mul array ', array, ' with value ', value, ' type ', typeof(array[0]))
	if typeof(array[0]) == TYPE_DICTIONARY or typeof(array[0]) == TYPE_ARRAY:
		for i in range(array.size()):
			for j in range(array[0].size()):
				array[i][j] = array[i][j] * value
		return array
	else:
		for i in range(array.size()):
			array[i] = array[i] * value
		return array

func array_add(array, value):
	if typeof(array[0]) == TYPE_DICTIONARY or typeof(array[0]) == TYPE_ARRAY:
		for i in range(array.size()):
			for j in range(array[0].size()):
				array[i][j] = array[i][j] + value
		return array
	
	else:
		for i in range(array.size()):
			array[i] = array[i] + value
		return array

func array_inv(array):
	if typeof(array[0]) == TYPE_DICTIONARY or typeof(array[0]) == TYPE_ARRAY:
		for i in range(array.size()):
			for j in range(array[0].size()):
				array[i][j] = 1 / array[i][j]
		return array
	
	else:
		for i in range(array.size()):
			array[i] = 1 / array[i]
		return array

func array_ard(array, array2):
	print('to ard ', array, ' and ', array2)
	if typeof(array[0]) == TYPE_DICTIONARY or typeof(array[0]) == TYPE_ARRAY:
		for i in range(array.size()):
			for j in range(array[0].size()):
				array[i][j] += array2[i][j]
		return array
	
	else:
		for i in range(array.size()):
			array[i] += array2[i]
		return array
