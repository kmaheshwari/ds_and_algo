class Solution
    # Trailing Zeros in Factorial
    # Given an integer n, return the number of trailing zeroes in n!. Note: Your solution should be in logarithmic time complexity. Example :
    # n = 5
    # n! = 120
    # Number of trailing zeros = 1
    # So, return 1
    # @param a : integer
    # @return an integer
    def trailingZeroes(a)
        count = 0
        i = 5
        while (a/i >= 1) do
            count += (a/i).to_i
            i *= 5
        end
        count
    end
end
