class Solution
    # Minimize the absolute difference
    # Given three sorted arrays A, B and Cof not necessarily same sizes. Calculate the minimum absolute difference between the maximum and minimum number from the triplet a, b, c such that a, b, c belongs arrays A, B, C respectively. i.e. minimize | max(a,b,c) - min(a,b,c) |. Example : Input:
    # A : [ 1, 4, 5, 8, 10 ]
    # B : [ 6, 9, 15 ]
    # C : [ 2, 3, 6, 6 ]
    # Output:
    # 1
    # Explanation: We get the minimum difference for a=5, b=6, c=6 as | max(a,b,c) - min(a,b,c) | = |6-5| = 1.
    # @param a : array of integers
    # @param b : array of integers
    # @param c : array of integers
    # @return an integer
    def solve(a, b, c)
        ma = a.length - 1
        mb = b.length - 1
        mc = c.length - 1

        min_diff = ([a[ma], b[mb], c[mc]].max - [a[ma], b[mb], c[mc]].min).abs
        # Check for the max element in arrays and keep going to the next largest element in that array
        while ma >= 0 && mb >= 0 && mc >= 0 do
            max_elem = [a[ma], b[mb], c[mc]].max
            min_elem = [a[ma], b[mb], c[mc]].min
            curr_diff = (max_elem - min_elem).abs

            min_diff = [curr_diff, min_diff].min

            if max_elem == a[ma]
                ma -= 1
            elsif max_elem == b[mb]
                mb -= 1
            else
                mc -= 1
            end
        end

        min_diff
    end
end