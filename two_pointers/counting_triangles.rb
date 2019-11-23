class Solution
    # Counting Triangles
    # You are given an array of N non-negative integers, A0, A1 ,..., AN-1. Considering each array element Ai as the edge length of some line segment, count the number of triangles which you can form using these array values. Notes:
    # You can use any value only once while forming each triangle. Order of choosing the edge lengths doesn't matter. Any triangle formed should have a positive area.
    # Return answer modulo 109 + 7.
    # For example,
    # A = [1, 1, 1, 2, 2]

    # Return: 4
    # @param a : array of integers
    # @return an integer
    def nTriang(a)
        a = a.sort
        n = a.length
        count = 0

        for i in (0..n-3) do
            k = i + 2
            for j in (i+1..n-2) do
                while (k < n && a[i] + a[j] > a[k]) do
                    k+=1
                end

                count += k - j - 1 if k > j
            end
        end
        count % (10**9 + 7)
    end
end
