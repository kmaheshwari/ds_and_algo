class Solution
    # Single Number II
    # Given an array of integers, every element appears thrice except for one which occurs once. Find that element which does not appear thrice. Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory? Input Format:
    #     First and only argument of input contains an integer array A
    # Output Format:
    #     return a single integer.
    # Constraints:
    # 2 <= N <= 5 000 000
    # 0 <= A[i] <= INT_MAX
    # For Examples :
    # Example Input 1:
    #     A = [1, 2, 4, 3, 3, 2, 2, 3, 1, 1]
    # Example Output 1:
    #     4
    # Explanation:
    #     4 occur exactly once
    # Example Input 2:
    #     A = [0, 0, 0, 1]
    # Example Output 2:
    #     1
    # @param a : constant array of integers
    # @return an integer
    def singleNumber(a)
      num = 0
      for i in (0..31) do
        sum_of_bits = 0
        a.each do |num|
          if (num & (1 << i)) > 0
            sum_of_bits += 1
          end
        end
        curr_bit = sum_of_bits % 3
        num += curr_bit*(2**i)
      end
      num
    end
end
