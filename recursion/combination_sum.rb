class Solution
    # Combination Sum
    # Given a set of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T. The same repeated number may be chosen from C unlimited number of times.
    #  Note:
    # All numbers (including target) will be positive integers.
    # Elements in a combination (a1, a2, … , ak) must be in non-descending order. (ie, a1 ≤ a2 ≤ … ≤ ak).
    # The combinations themselves must be sorted in ascending order.
    # CombinationA > CombinationB iff (a1 > b1) OR (a1 = b1 AND a2 > b2) OR ... (a1 = b1 AND a2 = b2 AND ... ai = bi AND ai+1 > bi+1)
    # The solution set must not contain duplicate combinations.
    # Example, Given candidate set 2,3,6,7 and target 7, A solution set is:
    # [2, 2, 3]
    # [7]

    # @param a : array of integers
    # @param b : integer
    # @return an array of array of integers
    def combinations(a,b,n,res,st)
        return if b < 0
        if b == 0
            @result << res.clone
            return
        end
        for i in (st..n-1) do
            if (b - a[i]) >= 0
                res.push(a[i])
                combinations(a, b - a[i], n, res,i)
                res.pop()
            end
        end
    end

    def combinationSum(a, b)
        a = a.sort.uniq
        n = a.length
        @result = []
        combinations(a,b,n,[],0)
        @result
    end
end
