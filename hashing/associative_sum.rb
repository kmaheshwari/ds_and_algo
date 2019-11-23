class Solution
    # Equal
    # Given an array A of integers, find the index of values that satisfy A + B = C + D, where A,B,C & D are integers values in the array Note:
    # 1) Return the indices `A1 B1 C1 D1`, so that
    #   A[A1] + A[B1] = A[C1] + A[D1]
    #   A1 < B1, C1 < D1
    #   A1 < C1, B1 != D1, B1 != C1

    # 2) If there are more than one solutions,
    #    then return the tuple of values which are lexicographical smallest.

    # Assume we have two solutions
    # S1 : A1 B1 C1 D1 ( these are values of indices int the array )
    # S2 : A2 B2 C2 D2

    # S1 is lexicographically smaller than S2 iff
    #   A1 < A2 OR
    #   A1 = A2 AND B1 < B2 OR
    #   A1 = A2 AND B1 = B2 AND C1 < C2 OR
    #   A1 = A2 AND B1 = B2 AND C1 = C2 AND D1 < D2
    # Example:
    # Input: [3, 4, 7, 1, 2, 9, 8]
    # Output: [0, 2, 3, 5] (O index)
    # If no solution is possible, return an empty list.
    # @param a : array of integers
    # @return an array of integers
    def equal(a)
        n = a.length
        sum_hash = {}
        result = []

        for i in (0..n-2) do
            for j in (i+1..n-1) do
                curr_sum = a[i]+ a[j]
                if sum_hash.include? curr_sum
                    previous_pair = sum_hash[curr_sum]
                    temp = previous_pair + [i, j]
                    if previous_pair[1] != i && previous_pair[1] != j && previous_pair[0] < i
                        if result.empty?
                            result = temp
                        else
                            result.zip(temp).each do |a, b|
                                break if b > a
                                if a > b
                                    result = temp
                                    break
                                end
                            end
                        end
                    end
                else
                    sum_hash[curr_sum] = [i, j]
                end
            end
        end
        return result
    end
end
