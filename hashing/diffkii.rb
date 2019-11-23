class Solution
    # Diffk II
    # Given an array A of integers and another non negative integer k, find if there exists 2 indices i and j such that A[i] - A[j] = k, i != j. Example : Input :
    # A : [1 5 3]
    # k : 2
    # Output :
    # 1
    # as 3 - 1 = 2
    # Return 0 / 1 for this problem.
    # @param a : constant array of integers
    # @param b : integer
    # @return an integer
    def diffPossible(a, b)
        n = a.length
        diff_h = {}
        diff_h[a[0]] = 0
        for i in (1...n) do
            if (diff_h.include? (a[i] - b)) || (diff_h.include? (a[i] + b))
                return 1
            else
                diff_h[a[i]] = i
            end
            # p diff_h
        end
        return 0
    end
end
