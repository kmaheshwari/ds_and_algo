class Solution
    # Count pairs in array whose sum is divisible by the given number
    # Given an array of integers A and an integer B, find and return the number of pairs in A whoes sum is divisible by B. Since the answer may be large, return the answer modulo (10^9 + 7).
    # Input Format
    # The first argument given is the integer array A.
    # The second argument given is the integer B.
    # Output Format
    # Return the total number of pairs for which the sum is divisible by B modulo (10^9 + 7).
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # 1 <= B <= 10^6
    # For Example
    # Input 1:
    #     A = [1, 2, 3, 4, 5]
    #     B = 2
    # Output 1:
    #     4

    # Input 2:
    #     A = [5, 17, 100, 11]
    #     B = 28
    # Output 2:
    #     1
    # @param a : array of integers
    # @param b : integer
    # @return an integer

    def nCr(n, k)
        return 0 if n < k
        k = n - k if(k > n - k)
        res = 1
        for i in (0..(k-1)) do
            res = res * (n - i)
            res = res / (i + 1)
        end
        res
    end

    def solve(a, b)
        total = 0
        count = [0]*b
        # create array for count of remainder 0 to b-1
        a.each{ |num| count[num%b] += 1 }

        # when b = 0
        total += nCr(count[0], 2)

        i = 1
        while (i <= b/2) && (i != b-i) do
            total += count[i]*count[b-i]
            i+=1
        end

        # when b is even
        if b%2 == 0
            total += nCr(count[b/2], 2)
        end
        total%(10**9+7)
    end
end
