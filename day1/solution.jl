using DelimitedFiles

depths = readdlm("day1/input.txt", Int)

# Part 1 
diffs = depths[2:end] .- depths[1:end-1]
num_increased = sum(diffs .> 0)
println("Part 1 answer: $(num_increased)")

# Part 2
smoothed_depths = zeros(length(depths) - 2)
for i = 3:(length(depths))
    smoothed_depths[i-2] = sum(depths[[i-2, i-1, i]])
end
smoothed_diffs = smoothed_depths[2:end] .- smoothed_depths[1:end-1]
smoothed_num_increased = sum(smoothed_diffs .> 0)
println("Part 2 answer: $(smoothed_num_increased)")
