import math
class Solution:
    # Reverse Bits
    # Reverse the bits of an 32 bit unsigned integer A. Input Format:
    #     First and only argument of input contains an integer A
    # Output Format:
    #     return a single unsigned integer denoting minimum xor value
    # Constraints:
    # 0 <= A < 2^32
    # For Examples :
    # Example Input 1:
    #     A = 0
    # Example Output 1:
    #     0
    # Explanation 1:
    #         00000000000000000000000000000000
    # =>      00000000000000000000000000000000
    # Example Input 2:
    #     A = 3
    # Example Output 2:
    #     3221225472
    # Explanation 2:
    #           00000000000000000000000000000011
    # =>        11000000000000000000000000000000
    # Since java does not have unsigned int, use long
    # @param A : unsigned integer
    # @return an unsigned integer
    def reverse(self, A):
        rev = 0
        for i in range(32):
            rev = (rev << 1) + (A&1)
            A = A >> 1
        return rev