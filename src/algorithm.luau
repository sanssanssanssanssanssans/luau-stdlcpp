local Utils = {}

function Utils.swap(arr, i, j)
	arr[i], arr[j] = arr[j], arr[i]
end

local function partition(arr, low, high)
	local pivot = arr[low]
	local i, j = low, high

	while true do
		repeat i = i + 1 until arr[i] >= pivot or i >= high
		repeat j = j - 1 until arr[j] <= pivot or j <= low

		if i >= j then break end
		Utils.swap(arr, i, j)
	end

	Utils.swap(arr, low, j)
	return j
end

function Utils.qsort(arr, low, high)
	if low < high then
		local p = partition(arr, low, high)
		Utils.qsort(arr, low, p - 1)
		Utils.qsort(arr, p + 1, high)
	end
end

function Utils.sort(arr)
	Utils.qsort(arr, 1, #arr)
end

function Utils.binary_search(arr, target)
	local low, high = 1, #arr
	while low <= high do
		local mid = math.floor((low + high) / 2)
		if arr[mid] == target then
			return true
		elseif arr[mid] < target then
			low = mid + 1
		else
			high = mid - 1
		end
	end
	return false
end

function Utils.reverse(arr)
	local i, j = 1, #arr
	while i < j do
		Utils.swap(arr, i, j)
		i = i + 1
		j = j - 1
	end
end

function Utils.max_element(arr)
	local max_index, max_val = 1, arr[1]
	for i = 2, #arr do
		if arr[i] > max_val then
			max_val, max_index = arr[i], i
		end
	end
	return max_index, max_val
end

function Utils.min_element(arr)
	local min_index, min_val = 1, arr[1]
	for i = 2, #arr do
		if arr[i] < min_val then
			min_val, min_index = arr[i], i
		end
	end
	return min_index, min_val
end
-- Accumulate sum
function Utils.accumulate(arr, initial)
	local sum = initial or 0
	for _, v in ipairs(arr) do
		sum = sum + v
	end
	return sum
end

function Utils.count(arr, value)
	local count = 0
	for _, v in ipairs(arr) do
		if v == value then
			count = count + 1
		end
	end
	return count
end

function Utils.find(arr, value)
	for i, v in ipairs(arr) do
		if v == value then
			return i
		end
	end
	return nil
end

function Utils.distance(start_index, end_index)
	return math.abs(end_index - start_index)
end

function Utils.next_permutation(arr)
	local i = #arr - 1
	while i > 0 and arr[i] >= arr[i + 1] do
		i = i - 1
	end

	if i == 0 then
		Utils.reverse(arr)
		return false
	end

	local j = #arr
	while arr[j] <= arr[i] do
		j = j - 1
	end

	Utils.swap(arr, i, j)
	Utils.reverse(arr, i + 1, #arr)
	return true
end

return Utils
