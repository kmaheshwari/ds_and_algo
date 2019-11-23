class Solution
    # Longest Substring Without Repeat
    # Given a string, find the length of the longest substring without repeating characters.
    # Example: The longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3.
    # For "bbbbb" the longest substring is "b", with the length of 1.
    # @param a : string
    # @return an integer
    def lengthOfLongestSubstring(a)
        n = a.length
        st = 0
        en = 0
        char_hash = {}
        max_length = 0
        cur_length = 0
        while en < n do
            if char_hash.include? a[en]
                st = [char_hash[a[en]] + 1, st].max
                cur_length = en - st + 1
            else
                cur_length += 1
            end
            max_length = [max_length, cur_length].max
            char_hash[a[en]] = en
            en += 1
        end
        max_length
    end
end
