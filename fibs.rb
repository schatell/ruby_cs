#fibs which takes a number and returns that many members of the fibonacci sequence. Use iteration for this solution.#

def fibs(i)
  x = 0
  y = 0
  last = 0
  if i >= 0
    for n in 1..i do
      puts x
      if x == 0
        x = 1
      end
      y = x
      x = x + last
      last = y
    end
  else puts x
  end
end

#fibs_rec which solves the same problem recursively.
def fibs_rec(n, result = [0, 1])
  if n > 1
    result << result[-2] + result[-1]
    fibs_rec(n-1, result)
  end
  result
end

fibs_rec(10)
