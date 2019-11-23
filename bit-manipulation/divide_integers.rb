class Solution
    # Divide Integers
    # Divide two integers without using multiplication, division and mod operator. Return the floor of the result of the division. Example:
    # 5 / 2 = 2
    # Also, consider if there can be overflow cases. For overflow case, return INT_MAX. Note: INT_MAX = 2^31 - 1
    # @param a : integer
    # @param b : integer
    # @return an integer
    INT_MAX = (2**31 -1)
    INT_MIN = -(2**31)
    def divide(a,b)
      return INT_MAX if b.zero?
      sign = ((a<0) ^ (b<0)) ? -1 : 1
      a = a.abs
      b = b.abs

      quotient = 0
      temp = 0

      31.downto(0) do |i|
        curr_div = (b << i)
        if (temp + curr_div) <= a
          temp += curr_div
          quotient += 2**i
        end
      end

      res = sign*quotient
      return INT_MAX if (res >= INT_MAX)
      res
    end
end
