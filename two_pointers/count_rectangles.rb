class Solution
    # Count of rectangles with area less than the given number
    # Given a sorted array of distinct integers A and an integer B, find and return how many rectangles with distinct configurations can be created using elements of this array as length and breadth whose area is lesser than B. (Note that a rectangle of 2 x 3 is different from 3 x 2 if we take configuration into view) For example:
    # A = [2 3 5],  B = 15
    # Answer = 6 (2 x 2, 2 x 3, 2 x 5, 3 x 2, 3 x 3, 5 x 2)
    # Note: As the answer may be large return the answer modulo (10^9 + 7).
    # Input Format
    # The first argument given is the integer array A.
    # The second argument given is integer B.
    # Output Format
    # Return the number of rectangles with distinct configurations with area less than B modulo (10^9 + 7).
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # 1 <= B <= 10^9
    # For Example
    # Input 1:
    #     A = [1, 2, 3, 4, 5]
    #     B = 5
    # Output 1:
    #     8

    # Input 2:
    #     A = [5, 10, 20, 100, 105]
    #     B = 110
    # Output 2:
    # 6
    # @param a : array of integers
    # @param b : integer
    # @return an integer
    def solve(a, b)
        n = a.length - 1
        i, j = 0, n
        count = 0
        while i <= n && j >= i do
            area = a[i] * a[j]
            if area < b
                count += (2*(j-i+1) - 1)
                i += 1
            else
                j -= 1
            end
        end
        count % (10**9 + 7)
    end
end
