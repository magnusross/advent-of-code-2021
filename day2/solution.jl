using DelimitedFiles

input = readdlm("day2/input.txt")
commands = input[:, 1]
dists = input[:, 2]

# Part 1
total_dist = str -> sum(dists[commands.==str])
horizontal = total_dist("forward")
vertical = total_dist("down") - total_dist("up")
println("Part 1 answer: $(vertical*horizontal)")

# Part 2 
aims = zeros(Int, length(commands))
aims[commands.=="up"] = -dists[commands.=="up"]
aims[commands.=="down"] = dists[commands.=="down"]
cumsum!(aims, aims)
vertical = sum(aims[commands.=="forward"] .* dists[commands.=="forward"])
println("Part 2 answer: $(vertical*horizontal)")