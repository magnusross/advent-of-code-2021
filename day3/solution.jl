using DelimitedFiles

# Load input
string_arr = readdlm("day3/input.txt", String)
# Part 1
sums = [mapreduce(x -> parse(Int, x[i]), +, string_arr) for i = 1:length(string_arr[1])]
gammab = 1(sums .>= length(string_arr) / 2)
epsb = 1(sums .< length(string_arr) / 2)
function to_dec(arr)
    sum(arr .* 2 .^ (length(arr) .- (1:length(arr))))
end
println("Part 1 answer: $(to_dec(epsb)*to_dec(gammab))")

# Part 2
function find_rating(op)
    int_arr = hcat([map(x -> parse(Int, x[i]), string_arr) for i = 1:length(string_arr[1])]...)
    for i = 1:size(int_arr)[2]
        target = 1op(sum(int_arr[:, i]), (size(int_arr)[1] / 2))
        int_arr = int_arr[int_arr[:, i].==target, :]
        if size(int_arr)[1] == 1
            break
        end
    end
    to_dec(int_arr')
end

oxy = find_rating(>=)
co2 = find_rating(<)

println("Part 2 answer: $(oxy*co2)")