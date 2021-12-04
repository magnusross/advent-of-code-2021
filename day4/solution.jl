using DelimitedFiles

# Load input
draws = map(x -> parse(Int, x), split(readdlm("day4/input1.txt")[1], ","))
boards = permutedims(reshape(readdlm("day4/input2.txt", Int), (5, :, 5)), (2, 1, 3))

# Part 1 
computewinners = arr -> mapslices(x -> (any(sum(x, dims = 1) .== 5)) | (any(sum(x, dims = 2) .== 5)), arr, dims = (2, 3))

mask = zeros(Int, size(boards))
for d in draws
    global mask += 1(boards .== d)
    is_winner = computewinners(mask)
    if any(is_winner)
        global winner = argmax(is_winner)[1]
        global win_draw = d
        break
    end
end

computescore = (idx, draw) -> sum(boards[idx, :, :] .* (((mask[idx, :, :] .+ 1) .% 2))) * draw
ans = computescore(winner, win_draw)
println("Part 1 answer: $(ans)")

# Part 2 
mask = zeros(Int, size(boards))
for d in draws
    global mask += 1(boards .== d)
    is_winner = computewinners(mask)
    if sum(1is_winner) == (size(boards)[1] - 1)
        global loser = argmin(is_winner)[1]
    end
    if all(is_winner)
        global loss_draw = d
        break
    end
end

ans = computescore(loser, loss_draw)
println("Part 2 answer: $(ans)")
