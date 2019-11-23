class Solution
    # Maximum Points on the same line
    # Given two array of integers A and B describing a pair of (A[i], B[i]) coordinates in 2-D plane. A[i] describe x coordinates of the ith point in 2D plane whereas B[i] describes the y-coordinate of the ith point in 2D plane. Find and return the maximum number of points which lie on the same line.
    # Input Format
    # The arguments given are integer arrays A and B.
    # Output Format
    # Return the maximum number of points which lie on the same line.
    # Constraints
    # 1 <= (length of the array A = length of array B) <= 1000
    # -10^5 <= A[i], B[i] <= 10^5
    # For Example
    # Input 1:
    #     A = [-1, 0, 1, 2, 3, 3]
    #     B = [1, 0, 1, 2, 3, 4]
    # Output 1:
    #     4
    #     The maximum number of point which lie on same line are 4, those points are {0, 0}, {1, 1}, {2, 2}, {3, 3}

    # Input 2:
    #     A = [3, 1, 4, 5, 7, -9, -8, 6]
    #     B = [4, -8, -3, -2, -1, 5, 7, -4]
    # Output 2:
    #     2
    # @param a : array of integers
    # @param b : array of integers
    # @return an integer
    def solve(a, b)
        n = a.length
        max_count = 0
        slope_hash = {}
        for i in (0...n) do
            curr_max = 0
            same_count = 0
            vertical = 0
            for j in (i+1...n) do
                if a[i] == a[j] && b[i] == b[j]
                    same_count += 1
                elsif a[i] == a[j]
                    vertical += 1
                else
                    if b[i] == b[j]
                        slope = 0.0
                    else
                        slope = (b[j] - b[i])*1.0/(a[j] - a[i])
                    end
                    if slope_hash.include? slope
                        slope_hash[slope] += 1
                    else
                        slope_hash[slope] = 1
                    end
                    curr_max = [curr_max, slope_hash[slope]].max
                end
                curr_max = [curr_max, vertical].max
            end
            max_count = [max_count, curr_max + same_count + 1 ].max
            slope_hash = {}
        end
        max_count
    end
end
