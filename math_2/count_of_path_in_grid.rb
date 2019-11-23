class Solution
    # Count of paths in a grid
    # Given an integer A, find and return the number of paths in a grid of size (A x A) that starts from (1, 1) and reaches (A, A) without crossing the major diagonal. Since the result can be large, return the result modulo (10^9 + 7). NOTE
    # The major diagonal of a matrix A is the collection of entries A[i][j] where i == j

    # Input Format
    # The only argument given is integer A.
    # Output Format
    # Return the number of paths modulo (10^9 + 7).
    # Constraints
    # 1 <= A <= 10^6
    # For Example
    # Input 1:
    #     A = 2
    # Output 1:
    #     1

    # Input 2:
    #     A = 5
    # Output 2:
    #     14
    # @param a : integer
    # @return an integer
    def nCr(n, k)
        k = n - k if(k > n - k)
        res = 1
        for i in (0..(k-1)) do
            res = res * (n - i)
            res = res / (i + 1)
        end
        res
    end
    def solve(a)
        # Can be solved by finding (n-1)th catalan number using formula (2nCn)/(n+1)
        a = a - 1
        c = nCr(2*a, a)
        res = c/(a+1)
        res%(10**9+7)
    end
end