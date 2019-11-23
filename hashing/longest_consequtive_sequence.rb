class Solution
    # Longest Consecutive Sequence
    # Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
    # Example: Given [100, 4, 200, 1, 3, 2], The longest consecutive elements sequence is [1, 2, 3, 4].
    # Return its length: 4. Your algorithm should run in O(n) complexity.
    # @param a : constant array of integers
    # @return an integer
    def longestConsecutive(a)
       n = a.length
       max_length = 0
       a_hash = {}
       a.each_with_index{|num, i| a_hash[num] = i}
       for i in (0..n-1) do
           unless a_hash.include? (a[i] - 1)
                j = a[i]
                while a_hash.include?(j) do
                    j+=1
                end
                max_length = [max_length, j-a[i]].max
           end
       end
       max_length
    end
end
