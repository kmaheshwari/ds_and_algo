class Solution
    # Single Element in a Sorted Array
    # Given a sorted array of integers A where every element appears twice except for one element which appears once, find and return this single element that appears only once.
    # Input Format
    # The only argument given is the integer array A.
    # Output Format
    # Return the single element that appears only once.
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # For Example
    # Input 1:
    #     A = [1, 1, 2, 2, 3]
    # Output 1:
    #     3

    # Input 2:
    #     A = [5, 11, 11, 100, 100]
    # Output 2:
    #     5
    # @param a : array of integers
    # @return an integer
    def solve(a)
        n = a.length
        low = 0
        high = n - 1

        while(low <= high) do
            mid = low + (high - low)/2
            return a[low] if low == high

            if mid.even?
                if a[mid] == a[mid+1]
                    low = mid + 2
                else
                    high = mid
                end
            else
                if a[mid] == a[mid - 1]
                    low = mid + 1
                else
                    high = mid - 1
                end
            end
        end
    end
end
