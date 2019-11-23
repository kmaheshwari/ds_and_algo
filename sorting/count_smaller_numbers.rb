class Solution
    # Count of smaller numbers after self
    # Given an array of integers A, find and return new integer array B. B array has the property where B[i] is the number of smaller elements to the right of A[i].
    # Input Format
    # The only argument given is the integer array A.
    # Output Format
    # Return the new integer array B.
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # For Example
    # Input 1:
    #     A = [1, 5, 4, 2, 1]
    # Output 1:
    #     B = [0, 3, 2, 1, 0]

    # Input 2:
    #     A = [5, 17, 100, 11]
    # Output 2:
    #     B = [0, 1, 1, 0]
    # @param a : array of integers
    # @return an array of integers
    def merge_sort(a)
        return a if a.length <= 1

        mid = a.length/2
        left = merge_sort(a[0...mid])
        right = merge_sort(a[mid..-1])

        i,j = 0,0
        while (i < left.length || j < right.length) do
            if (j == right.length || i < left.length && left[i][0] <= right[j][0])
                a[i+j] = left[i]
                @count[left[i][1]] += j
                i += 1
            else
                a[i+j] = right[j]
                j += 1
            end
        end
        return a
    end

    def solve(a)
        # brute force
        # n = a.length
        # i = 0
        # b = []
        # while i < n-1 do
        #     j = i + 1
        #     count = 0
        #     while j <= n - 1 do
        #       count+=1 if a[i] > a[j]
        #       j+=1
        #     end
        #     b << count
        #     i+=1
        # end
        # b << 0

        # Using merge sort
        n = a.length
        arr_index_map = a.each_with_index.to_a
        @count = [0]*n
        merge_sort(arr_index_map)
        @count
    end
end
