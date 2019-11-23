class Solution
    # Largest Continuous Sequence Zero Sum
    # Find the largest continuous sequence in a array which sums to zero. Example:
    # Input:  {1 ,2 ,-2 ,4 ,-4}
    # Output: {2 ,-2 ,4 ,-4}
    #  NOTE : If there are multiple correct answers, return the sequence which occurs first in the array.
    # @param a : array of integers
    # @return an array of integers
    def lszero(a)
        sum = 0
        a_hash = {}
        j = 0
        max_length = 0
        max_sub = []
        a.each_with_index do |n, i|
            sum += n
            if sum.zero?
                max_sub[0] = j
                max_sub[1] = i
                max_length = i + 1
            end

            if a_hash.include?(sum)
                if (i - a_hash[sum]) > max_length
                    max_sub[0] = a_hash[sum] + 1
                    max_sub[1] = i
                    max_length = i - a_hash[sum]
                end
            else
                a_hash[sum] = i
            end
        end
        if max_sub.length > 0
            a[max_sub[0]..max_sub[1]]
        else
            []
        end
    end
end
