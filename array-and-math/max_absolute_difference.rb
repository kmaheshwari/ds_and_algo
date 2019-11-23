class Solution
    # Maximum Absolute Difference
    # You are given an array of N integers, A1, A2 ,..., AN. Return maximum value of f(i, j) for all 1 ≤ i, j ≤ N. f(i, j) is defined as |A[i] - A[j]| + |i - j|, where |x| denotes absolute value of x. For example,
    # A=[1, 3, -1]

    # f(1, 1) = f(2, 2) = f(3, 3) = 0
    # f(1, 2) = f(2, 1) = |1 - 3| + |1 - 2| = 3
    # f(1, 3) = f(3, 1) = |1 - (-1)| + |1 - 3| = 4
    # f(2, 3) = f(3, 2) = |3 - (-1)| + |2 - 3| = 5

    # So, we return 5.
    # @param a : array of integers
    # @return an integer
    def maxArr(a)
        max1,min1,max2,min2 = [-(2**31), (2**31 - 1), -(2**31), (2**31 - 1)]
        a.each_with_index do |num, i|
            max1 = num + i if (num+i) > max1
            min1 = num + i if (num+i) < min1
            max2 = num - i if (num-i) > max2
            min2 = num - i if (num-i) < min2
        end
        [(max1 - min1), (max2 - min2)].max
    end
end
