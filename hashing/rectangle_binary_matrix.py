class Solution:
    # Find Rectangle in binary matrix
    # Given a binary matrix of integers A of size N x M consisting of only 0 or 1. you need to check whether there exists a square or rectangle in a square whose all four corners are 1. All four corners need to be distinct. If there exists such rectangle or square return 1, else return 0. 
    # Input Format
    # The first argument given is the integer matrix A.
    # Output Format
    #  Return 1 if there exists such rectangle/square whose all four corners are 1 else return 0.
    # Constraints
    # 1 <= N, M <= 200
    # 0 <= A[i] <= 1
    # For Example
    # Input 1:
    #     A = [   [0, 1, 1]
    #             [0, 1, 1]
    #             [0, 1, 0]   ]
    # Output 1:
    #     1
    #     Explanation 1:
    #     [ [1, 1]
    #       [1, 1] ]
    #       There exists a square whose all corners are 1.

    # Input 2:
    #     A = [   [0, 1, 1]
    #             [0, 0, 1]
    #             [0, 1, 0]   ]
    # Output 2:
    #     0
    # @param A : tuple of list of integers
    # @return an integer
    def solve(self, matrix):
        # finding row and column size  
        rows = len(matrix) 
        if (rows == 0): 
            return False
      
        columns = len(matrix[0]) 
      
        # map for storing the index of  
        # combination of 2 1's  
        table = {} 
      
        # scanning from top to bottom  
        # line by line  
        for i in range(rows):  
            for j in range(columns - 1): 
                for k in range(j + 1, columns):  
      
                    # if found two 1's in a column  
                    if (matrix[i][j] == 1 and
                        matrix[i][k] == 1): 
      
                        # check if there exists 1's in same  
                        # row previously then return true  
                        if (j in table and k in table[j]): 
                            return 1
      
                        if (k in table and j in table[k]): 
                            return 1
      
                        # store the indexes in hashset  
                        if j not in table: 
                            table[j] = set() 
                        if k not in table: 
                            table[k] = set() 
                        table[j].add(k)  
                        table[k].add(j) 
        return 0
