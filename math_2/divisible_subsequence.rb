class Solution
    # Size three subsequences divisible by B
    # Given an array of integers A and an integer B. Find and return the number of subsequences of length 3 whose sum is divisible by B. Since the total number of subsequences may be very large. Return the total number of subsequences of length 3 whose sum is divisible by B modulo (109+7).
    # Input Format
    # The only argument given is the integer array A.
    # Output Format
    # Return the number of subsequences of length 3 whose sum is divisible by B modulo (10^9+7).
    # Constraints
    # 1 <= length of the array <= 100000
    # 1 <= A[i] <= 10^9
    # 1 <= B <= 10^3
    # For Example
    # Input 1:
    #     A = [6, 1, 1, 4, 1, 5, 3]
    #     B = 2
    # Output 1:
    #     20

    # Input 2:
    #     A = [4, 10, 9]
    #     B = 5
    # Output 2:
    #     0
    # @param a : array of integers
    # @param b : integer
    # @return an integer
    def nCr(n, r)
        r = n - r if(r > n - r)
        res = 1
        for i in (0..(r-1)) do
            res = res * (n - i)
            res = res / (i + 1)
        end
        res
    end

    def solve(a, b)
        total = 0
        count = {}
        # create hash for 0 to b-1
        (b-1).downto(0).each{ |i| count[i] = 0 }
        a.each{ |num| count[num%b] += 1 }
        for i in (0..(b-1)) do
            for j in (i..(b-1)) do
                k = (b - (i+j)%b)%b
                next unless (i<=j && j<=k)
                if (i == j) && (j == k)
                    total += (count[i]*(count[i]-1)*(count[i]-2))/6
                    # total += nCr(count[i],3)
                elsif i == j
                    total += (count[i]*(count[i]-1)*count[k])/2
                    # total += (nCr(count[i], 2) * count[k])
                elsif j == k
                    total += (count[j]*(count[j]-1)*count[i])/2
                    # total += (nCr(count[j], 2) * count[i])
                elsif i == k
                    total += (count[i]*(count[i]-1)*count[j])/2
                    # total += (nCr(count[k], 2) * count[j])
                else
                    total += count[i]*count[j]*count[k]
                end
            end
        end
        total%(10**9+7)
    end
end
