class Solution
    # Count of pairs with the given sum
    # Given a sorted array of distinct integers A and an integer B, find and return how many pair of integers ( A[i], A[j] ) such that i != j have sum equal to B.
    # Input Format
    # The first argument given is the integer array A.
    # The second argument given is integer B.
    # Output Format
    # Return the number of pairs for which sum is equal to B.
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # 1 <= B <= 10^9
    # For Example
    # Input 1:
    #     A = [1, 2, 3, 4, 5]
    #     B = 5
    # Output 1:
    #     2

    # Input 2:
    #     A = [5, 10, 20, 100, 105]
    #     B = 110
    # Output 2:
    #     2
    # @param a : array of integers
    # @param b : integer
    # @return an integer
    def solve(a, b)
        n = a.length - 1
        i, j = 0, n
        count = 0
        while i <= (n - 1) && j > i do
            sum = a[i] + a[j]
            if sum == b
                count += 1
                i+=1
            elsif sum > b
                j -= 1
            else
                i += 1
            end
        end
        count
    end
end
