class Solution
    # Subset
    # Given a set of distinct integers, S, return all possible subsets.
    #  Note:
    # Elements in a subset must be in non-descending order.
    # The solution set must not contain duplicate subsets.
    # Also, the subsets should be sorted in ascending ( lexicographic ) order.
    # The list is not necessarily sorted.
    # Example : If S = [1,2,3], a solution is:
    # [
    #   [],
    #   [1],
    #   [1, 2],
    #   [1, 2, 3],
    #   [1, 3],
    #   [2],
    #   [2, 3],
    #   [3],
    # ]
    # @param a : array of integers
    # @return an array of array of integers
    def subset(a, n, st, res)
        @result << res.clone
        for i in (st..n-1) do
            res.push(a[i])
            subset(a,n,i+1,res)
            res.pop
        end
        return
    end

    def subsets(a)
        a = a.sort
        n = a.length
        @result = []
        subset(a,n,0,[])
        @result
    end
end
