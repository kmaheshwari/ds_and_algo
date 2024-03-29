class Solution
    # Min XOR value
    # Given an integer array A of N integers, find the pair of integers in the array which have minimum XOR value. Report the minimum XOR value. Input Format:
    #     First and only argument of input contains an integer array A
    # Output Format:
    #     return a single integer denoting minimum xor value
    # Constraints:
    # 2 <= N <= 100 000
    # 0 <= A[i] <= 1 000 000 000
    # For Examples :
    # Example Input 1:
    #     A = [0, 2, 5, 7]
    # Example Output 1:
    #     2
    # Explanation:
    #     0 xor 2 = 2
    # Example Input 2:
    #     A = [0, 4, 7, 9]
    # Example Output 2:
    #     3
    # @param a : array of integers
    # @return an integer
    def findMinXor(a)
        # sort the array and find xor of adjacent elements in array
        a = a.sort
        min = (2**(0.size * 8 -2) -1) #fixnum_max
        n = a.length
        for i in (0..n-2) do
            xor = a[i]^a[i+1]
            if xor < min
                min = xor
                pair = [a[i], a[i+1]]
            end
        end
        min
    end
end
