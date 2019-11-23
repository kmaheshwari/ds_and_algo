class Solution
    # All Unique Permutations
    # Given a collection of numbers that might contain duplicates, return all possible unique permutations. Example : [1,1,2] have the following unique permutations:
    # [1,1,2]
    # [1,2,1]
    # [2,1,1]
    #  NOTE : No 2 entries in the permutation sequence should be the same.
    # @param a : array of integers
    # @return an array of array of integers
    def unique_permutation(a, i, n, res=[])
        if (i >= n)
            res << a.clone
            return res
        end
        for j in (i..n) do
            # swap = isFeasible(a, i, j)
            pre = a[i...j].include? a[j]
            next if pre
            a[i],a[j] = a[j],a[i]
            unique_permutation(a, i+1, n, res)
            a[i],a[j] = a[j],a[i]
        end
        res
    end

    def permute(a)
        n = a.length
        unique_permutation(a, 0, n - 1)
    end
end
