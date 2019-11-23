class Solution
    # Xor queries
    # You are given an array (containing only 0 and 1) as element of N length. Given L and R, you need to determine value of XOR of all elements from L to R (both inclusive) and number of unset bits (0's) in the given range of the array. Input
    # First argument contains the array of size N containing 0 and 1 only (1<=N<=100000).

    # Second argument contains a 2D array with Q rows and 2 columns, each row represent a query with 2 columns representing L and R.

    # (1<=Q<=100000), (1<=L<=R<=N).
    # Output
    # Return an 2D array of Q rows and 2 columns i.e the xor value and number of unset bits in that range respectively for each query.
    # Examples Input
    # 1 0 0 0 1
    # 2 4
    # 1 5
    # 3 5
    # Output
    # 0 3
    # 0 3
    # 1 2
    # Explanation Testcase 1-
    # In the given case the bit sequence is of length 5 and the sequence is 1 0 0 0 1. For query 1 the range is (2,4), and the answer is (array[2] xor array[3] xor array[4]) = 0, and number of zeroes are 3, so output is 0 3. Similarly for other queries.

    # @param a : array of integers
    # @param b : array of array of integers
    # @return an array of array of integers
    def solve(a, b)
      cum = []
      cum[0] = 0
      for i in (1..(a.count)) do
        cum[i] = cum[i-1] + a[i-1]
      end
      res = []
      b.each do |query|
        l = query[0]
        r = query[1]
        xor = cum[r] - cum[l-1]
        zeroes = (r-l+1) - xor
        res << [xor%2, zeroes]
      end
      res
    end
end
