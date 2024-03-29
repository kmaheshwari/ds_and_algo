class Solution
    # B Closest Points to Origin
    # We have a list A, of points(x,y) on the plane. Find the B closest points to the origin (0, 0). Here, the distance between two points on a plane is the Euclidean distance. You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in.) Note: Euclidean distance between two points P1(x1,y1) and P2(x2,y2) is sqrt( (x1-x2)^2 + (y1-y2)^2 ).
    # Input Format
    # The argument given is list A and an integer B.
    # Output Format
    # Return the B closest points to the origin (0, 0) in any order.
    # Constraints
    # 1 <= B <= length of the list A <= 100000
    # -100000 <= A[i][0] <= 100000
    # -100000 <= A[i][1] <= 100000
    # For Example
    # Input 1:
    #     A = [   [1, 3],
    #             [-2, 2]  ]
    #     B = 1
    # Output 1:
    #     [ [-2, 2] ]

    # Input 2:
    #     A =[    [3, 3],
    #             [5, -1],
    #             [-2, 4]  ]
    #     B = 2
    # Output 2:
    #     [ [3, 3], [-2, 4] ]
    # @param a : array of array of integers
    # @param b : integer
    # @return an array of array of integers
    def solve(a, b)
        a.sort_by!{|pt| (pt[0]**2 + pt[1]**2)}[0...b]
        # n = a.length - 1
        # count = 0
        # res = []
        # for i in (0..n) do
        #     min_index = i
        #     for j in (i..n) do
        #         min_index = j if (dist[j] < dist[min_index])
        #     end
        #     p min_index
        #     count += 1
        #     res << a[min_index]
        #     break if count == b
        #     dist[i], dist[min_index] = dist[min_index], dist[i]
        # end
        # res
    end
end
