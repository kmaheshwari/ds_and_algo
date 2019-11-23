class Solution
    # Find pairs in array whose sum is already present
    # Given an array A of N distinct and positive elements, the task is to find number of unordered pairs whose sum already exists in given array. Expected Complexity : n^2 CONSTRAINTS
    # 1 <= N <= 1000
    # 1 <= A[i] <= 10^6 + 5
    # SAMPLE INPUT
    # A : [ 3, 4, 2, 6 ,7]
    # SAMPLE OUTPUT
    # 2
    # EXPLANATION
    # The pairs following the conditions are :
    # (2,4) = 6,
    # (3,4) = 7
    # @param a : array of integers
    # @return an integer
    def solve(a)
        n = a.length
        a_hash = {}
        count = 0
        a.each_with_index do |num, i|
            a_hash[num] = i
        end

        for i in (0..n-2) do
            for j in (i+1..n-1) do
                sum = a[i]+a[j]
                if a_hash.include? sum
                    count += 1
                end
            end
        end
        count
    end
end
