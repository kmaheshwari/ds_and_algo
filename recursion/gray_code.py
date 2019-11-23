class Solution:
    # Gray Code
    # The gray code is a binary numeral system where two successive values differ in only one bit. Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0. For example, given n = 2, return [0,1,3,2]. Its gray code sequence is:
    # 00 - 0
    # 01 - 1
    # 11 - 3
    # 10 - 2
    # There might be multiple gray code sequences possible for a given n. Return any such sequence.
    # @param A : integer
    # @return a list of integers
    def grayCode(self, A):
        Solution.result = []
        def grays(curr_num, n):
            if n == 0:
                Solution.result.append(curr_num[0])
                return
            
            grays(curr_num, n - 1)
            curr_num[0] = curr_num[0] ^ (1 << (n - 1))
            grays(curr_num, n - 1)
        curr_num = [0]
        grays(curr_num, A)
        return Solution.result