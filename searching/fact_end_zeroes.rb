class Solution
    # Preimage Size of Factorial Zeroes Function
    # Let f(A) be the number of zeroes at the end of A!. (Recall that x! = 1 * 2 * 3 * ... * x, and by convention, 0! = 1.) For example, f(3) = 0 because 3! = 6 has no zeroes at the end, while f(11) = 2 because 11! = 39916800 has 2 zeroes at the end. Given A, find how many non-negative integers x have the property that f(x) = A. Input Format:
    #     First and only argument to input is a single integer A.
    # Output Format:
    #     Return a single integer denoting number of non-negative integers x having f(x) = A.
    # Constraints:
    #     0 <= A <= 10^9
    # For Example:
    # Input 1:
    #     A = 0
    # Output 1:
    #     5
    # Explanation:
    #     0!, 1!, 2!, 3!, and 4! end with K = 0 zeroes.
    # Input 2:
    #     A = 5
    # Output 2:
    #     0
    # @param a : integer
    # @return an integer
    def no_of_zeroes(a)
        count = 0
        while (a > 0) do
            a = a/5
            count += a
        end
        count
    end

    def solve(a)
        low = 0
        high = 10000000000
        res = 0

        while (low < high) do
            mid = (high + low)/2
            if (no_of_zeroes(mid) < a)
                low = mid + 1
            else
                high = mid
            end
        end

        while (no_of_zeroes(low) == a) do
            res += 1
            low += 1
        end
        res
    end
end
