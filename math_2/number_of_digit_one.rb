class Solution
    # Number of Digit One
    # Given an integer A, find and return the total number of digit 1 appearing in all non-negative integers less than or equal to A.
    # Input Format
    # The only argument given is the integer A.
    # Output Format
    # Return the total number of digit 1 appearing in all non-negative integers less than or equal to A.
    # Constraints
    # 0 <= A <= 10^9
    # For Example
    # Input 1:
    #     A = 10
    # Output 1:
    #     2

    # Input 2:
    #     A = 20
    # Output 2:
    #     12
    # @param a : integer
    # @return an integer
    def solve(a)
        return 0 if (a <= 0)
        count = 0
        q = a
        x = 1
        loop do
            curr_digit = q % 10
            q /= 10
            # number of 1's in xth place
            count += q * x
            # remainder for counts of (x+1)th position
            count += a % x + 1 if (curr_digit == 1)
            count += x if (curr_digit >  1)
            x *= 10
            break if (q == 0)
        end
        count
    end
end