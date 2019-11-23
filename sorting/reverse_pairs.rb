class Solution
    # Reverse Pairs
    # Given an array of integers A, we call (i, j) an important reverse pair if i < j and A[i] > 2*A[j]. Return the number of important reverse pairs in the given array A.
    # Input Format
    # The only argument given is the integer array A.
    # Output Format
    # Return the number of important reverse pairs in the given array A.
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # For Example
    # Input 1:
    #     A = [1, 3, 2, 3, 1]
    # Output 1:
    #     2

    # Input 2:
    #     A = [2, 4, 3, 5, 1]
    # Output 2:
    #     3
    # @param a : array of integers
    # @return an integer
    def merge_sort(a, st, en)
        return 0 if st >= en
        mid = st + (en - st)/2
        count = merge_sort(a, st, mid) + merge_sort(a, mid+1, en)

        # merging and counting
        temp = [0]*(en - st + 1)
        i,j,k = st, mid+1, st
        ctr = mid+1
        while(i <= mid) do
            while(ctr <= en && a[i]/2 > a[ctr]) do
                ctr+=1
            end
            @count += ctr - (mid+1)

            while(j <= en && a[i] > a[j]) do
                temp[k] = a[j]
                k+=1
                j+=1
            end
            temp[k] = a[i]
            i+=1
            k+=1
        end
        while(j<=en) do
            temp[k] = a[j]
            k+=1
            j+=1
        end
        a[st..en] = temp[st..en]
        return @count
    end

    def solve(a)
        n = a.length
        @count = 0
        merge_sort(a, 0, n-1)
    end
end
