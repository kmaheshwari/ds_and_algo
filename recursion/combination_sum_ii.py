class Solution:
    # Combination Sum II
    # Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T. Each number in C may only be used once in the combination.
    #  Note:
    # All numbers (including target) will be positive integers.
    # Elements in a combination (a1, a2, … , ak) must be in non-descending order. (ie, a1 ≤ a2 ≤ … ≤ ak).
    # The solution set must not contain duplicate combinations.
    # Example : Given candidate set 10,1,2,7,6,1,5 and target 8, A solution set is:
    # [1, 7]
    # [1, 2, 5]
    # [2, 6]
    # [1, 1, 6]

    # @param A : list of integers
    # @param B : integer
    # @return a list of list of integers
    def combinationSum(self, A, B):
        n = len(A)
        A.sort()
        Solution.result = []
        def combinations(st, comb, target):
            if target < 0: return
            if target == 0:
                Solution.result.append(comb[:])
                return
            previous_can = -1
            for i in range(st,n):
                if target - A[i] >= 0 and A[i] != previous_can:
                    comb.append(A[i])
                    combinations(i+1, comb, target - A[i])
                    comb.pop()
                    previous_can = A[i]
        combinations(0, [], B)
        return Solution.result
                