class Solution
    # Window String
    # Given a string S and a string T, find the minimum window in S which will contain all the characters in T in linear time complexity. Note that when the count of a character C in T is N, then the count of C in minimum window in S should be at least N. Example :
    # S = "ADOBECODEBANC"
    # T = "ABC"
    # Minimum window is "BANC"
    #  Note:
    # If there is no such window in S that covers all characters in T, return the empty string ''.
    # If there are multiple such windows, return the first occurring minimum window ( with minimum start index ).
    # @param a : string
    # @param b : string
    # @return a string
    def minWindow(a, b)
        b_hash = {}
        b.each_char do |char|
            if b_hash.include? char
                b_hash[char] += 1
            else
                b_hash[char] = 1
            end
        end

        n = a.length
        st, en = 0, 0
        a_hash = {}
        min_str = ""
        min_len = 2**31 - 1
        count = 0
        while en < n do
            if a_hash.include? a[en]
                a_hash[a[en]] += 1
            else
                a_hash[a[en]] = 1
            end

            if (b_hash.include? a[en]) && (a_hash[a[en]] <= b_hash[a[en]])
                count += 1
            end

            if count == b.length
                # p a_hash[a[st]]
                while ((b_hash.include? a[st]) && a_hash[a[st]] > b_hash[a[st]]) || !(b_hash.include? a[st]) do
                    if ((b_hash.include? a[st]) && a_hash[a[st]] > b_hash[a[st]])
                        a_hash[a[st]] -= 1
                    end
                    st += 1
                end
                curr_len = en - st + 1
                if (curr_len < min_len)
                    min_len = curr_len
                    min_str = a[st...st+curr_len]
                end
            end
            en += 1
        end
        min_str
    end
end
