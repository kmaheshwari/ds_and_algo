class Solution
    # Smallest sequence with given Primes
    # Given three prime number(p1, p2, p3) and an integer k. Find the first(smallest) k integers which have only p1, p2, p3 or a combination of them as their prime factors. Example: Input :
    # Prime numbers : [2,3,5]
    # k : 5 If primes are given as p1=2, p2=3 and p3=5 and k is given as 5, then the sequence of first 5 integers will be:
    #  Output:
    # {2,3,4,5,6} Explanation :
    # 4 = p1 * p1 ( 2 * 2 ) 6 = p1 * p2 ( 2 * 3 ) Note: The sequence should be sorted in ascending order
    # @param a : integer
    # @param b : integer
    # @param c : integer
    # @param d : integer
    # @return an array of integers
    def solve(a, b, c, d)
        # result = [1]
        # ai, bi, ci = 0, 0, 0
        # na = a
        # nb = b
        # nc = c
        # for i in (1..d) do
        #     result[i] = [na, nb, nc].min

        #     if result[i] == na
        #         ai += 1
        #         na = result[ai]*a
        #     elsif result[i] == nb
        #         bi += 1
        #         nb = result[bi]*b
        #     elsif result[i] == nc
        #         ci += 1
        #         nc = result[ci]*c
        #     end
        # end
        # return result[1..d]
        result = [1]
        primes = [a, b, c]
        ugly_by_prime = [a, b, c]
        idx = [0, 0, 0]
        for i in (1..d) do
            result[i] = ugly_by_prime.min
            for k in (0..2) do
                if result[i] == ugly_by_prime[k]
                    idx[k] += 1
                    ugly_by_prime[k] = primes[k]*result[idx[k]]
                end
            end
        end
        return result[1..d]
    end
end
