class Solution
    # Longest Subarray Sum B
    # Given an array of integers A of size N and an integer B. Find the length of longest subarray having sum equal to B. If no such subarray exists then return -1.
    # Input Format
    # The First argument given is the integer array A.
    # The Second argument is an integer B.
    # Output Format
    # Return the length of longest subarray having sum equal to B if exists else return -1.
    # Constraints
    # 1 <= N <= 100000
    # -10^6 <= A[i] <= 10^6
    # -10^9 <= B <= 10^9
    # For Example
    # Input 1:
    #     A = [1, 2, 3, 4, 5]
    #     B = 10

    # Output 1:
    #     4

    # Input 2:
    #     A = [1, -1, -1, 1]
    #     B = 0
    # Output 2:
    #     4
    # @param a : array of integers
    # @param b : integer
    # @return an integer
    def solve(a, b)
        sum = 0
        a_hash = {}
        max_length = -1
        a.each_with_index do |num, i|
            sum += num
            if num == b
                max_length = [1, max_length].max
            end

            if sum == b
                max_length = i + 1
            end

            unless a_hash.include? sum
                a_hash[sum] = i
            end

            if a_hash.include? (sum - b)
                index = a_hash[sum - b]
                max_length = [max_length, (i - index)].max
            end
        end
        max_length
    end
end
