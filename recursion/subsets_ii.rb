class Solution
    # Subsets II
    # Given a collection of integers that might contain duplicates, S, return all possible subsets.
    #  Note:
    # Elements in a subset must be in non-descending order.
    # The solution set must not contain duplicate subsets.
    # The subsets must be sorted lexicographically.
    # Example : If S = [1,2,2], the solution is:
    # [
    # [],
    # [1],
    # [1,2],
    # [1,2,2],
    # [2],
    # [2, 2]
    # ]
    # @param a : array of integers
    # @return an array of array of integers
    def subsets(a, n, st, res)
        @result << res.clone
        prev_elem = -1
        for i in (st..n-1) do
            if a[i] != prev_elem
                res.push(a[i])
                subsets(a,n,i+1,res)
                res.pop
                prev_elem = a[i]
            end
        end
        return
    end

    def subsetsWithDup(a)
        n = a.length
        a = a.sort
        @result = []
        subsets(a, n, 0, [])
        @result
    end
end
