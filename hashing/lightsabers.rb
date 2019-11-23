class Solution
    # Lightsabers
    # Given two array of integers A and B of size N and M respectively. The goal is to select some continuous interval in A such that there are exactly B[0] elements with value 1, B[1] elements with value 2 and so on ending with B[m-1] elements with value m. However, it is not always possible to select such an interval form the given array therefore it is allowed to remove some elements from A in order to achieve the goal. Find and return the minimum number of elements to be removed from A in order to achieve the goal. If it is not possible to achieve the goal return -1 instead.
    # Input Format
    # The first argument given is the integer array A.
    # The second argument given is the integer array B.
    # Output Format
    # Return the minimum number of elements to be removed from A in order to achieve the goal and
    # if it is not possible to achieve the goal return -1 instead.
    # Constraints
    # 1 <= N, M <= 100000
    # 1 <= A[i] <= M
    # 0 <= B[i] <= N
    # For Example
    # Input 1:
    #     A = [1, 2, 3, 4, 1]
    #     B = [2, 1, 1, 0]
    # Output 1:
    #     1   (Reomve element 4 and consider all the remaining elements).

    # Input 2:
    #     A = [1, 1, 2, 2, 2]
    #     B = [1, 2, 1]
    # Output 2:
    #     -1
    # @param a : array of integers
    # @param b : array of integers
    # @return an integer
    def solve(a, b)
        # a_hash = a.inject(Hash.new(0)) {|hash, num| hash[num]+=1; hash}
        m = b.length
        n = a.length
        a = a.map{|i| i - 1 }
        h = {}
        for i in (0...m) do
            h[i] = 0 if b[i] == 0
        end
        return 0 if h.size == m
        extras = 0
        l = 0
        r = 0
        dp = [0]*m
        extra = 2**31 - 1
        # while en < n do
        #     if r_hash.include? a[en]
        #         r_hash[a[en]] +=1
        #     else
        #         r_hash[a[en]] = 1
        #     end

        # end
        while(true) do
            if h.size < m
                break if r == n
                dp[a[r]]+=1
                if dp[a[r]] == b[a[r]]
                    h[a[r]] = 0
                elsif dp[a[r]] > b[a[r]]
                    extras +=1
                end
                r+=1
            else
                extra = [extra, extras].min
                break if l == n
                dp[a[l]] -= 1
                if dp[a[l]] == b[a[l]] - 1
                    h.delete(a[l])
                elsif dp[a[l]] >= b[a[l]]
                    extras -=1
                end
                l+=1
            end
        end
        return -1 if extra == 2**31 - 1
        return extra
    end
end
