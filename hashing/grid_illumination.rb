class Solution
    # Grid Illumination
    # You are given an integer A. On a A x A grid of cells, each cell (x, y) with 0 <= x < A and 0 <= y < A has a lamp. Initially, some number of lamps are on. B[i] tells us the location of the i-th lamp that is on. Each lamp that is on illuminates every square on its x-axis, y-axis, and both diagonals (similar to a Queen in chess). For the i-th query C[i] = (x, y), the answer to the query is 1 if the cell (x, y) is illuminated, else 0. After each query (x, y) [in the order given by queries], we turn off any lamps that are at cell (x, y) or are adjacent 8-directionally (ie., share a corner or edge with cell (x, y).) Return an array of D. Each value D[i] should be equal to the answer of the i-th query C[i].
    # Input Format
    # The first argument given is the integer A.
    # The second argument given is the integer matrix B.
    # The third argument given is the integer matrix C.
    # Output Format
    # Return an array of integers D. Each value D[i] should be equal to the answer of the i-th query C[i]
    # Constraints
    # 1 <= A <= 10^9
    # 1 <= B.length , C.length <= 20000
    # B[i].length = C[i].length = 2
    # For Example
    # Input 1:
    #     A = 5
    #     B = [[0,4], [4,4]]
    #     C = [[1,1], [1,0]]
    # Output 1:
    #     D = [1, 0]

    # Input 2:
    #     A = 6
    #     B = [[1,3], [2,4], [5,4]]
    #     C = [[2,4], [1,2]]
    # Output 2:
    #     D = [1, 0]
    # @param a : integer
    # @param b : array of array of integers
    # @param c : array of array of integers
    # @return an array of integers
    def solve(a, b, c)
        row_hash = {}
        col_hash = {}
        f_dia_hash = {}
        b_dia_hash = {}
        result = []
        # light lamps
        b.each do |lamp|
            row = lamp[0]
            col = lamp[1]
            row_hash.include?(row) ? row_hash[row].push(a*row+col) : row_hash[row] = [a*row+col]
            col_hash.include?(col) ? col_hash[col].push(a*row+col) : col_hash[col] = [a*row+col]
            f_dia_hash.include?(row+col) ? f_dia_hash[row+col].push(a*row+col) : f_dia_hash[row+col] = [a*row+col]
            b_dia_hash.include?(row-col) ? b_dia_hash[row-col].push(a*row+col) : b_dia_hash[row-col] = [a*row+col]
        end
        dirs = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,0],[0,1],[1,-1],[1,0],[1,1]]
        # queries
        c.each do |query|
            row = query[0]
            col = query[1]

            # check if lamp is lit
            if (row_hash.include?(row)) || (col_hash.include?(col)) || (f_dia_hash.include?(row+col)) || (b_dia_hash.include?(row-col))
                result.push(1)
            else
                result.push(0)
            end

            # turn off lamps
            dirs.each do |dir|
                dx = dir[0]
                dy = dir[1]
                dir_x = row + dx
                dir_y = col + dy

                if row_hash.include?(dir_x) && row_hash[dir_x].include?(a*dir_x+dir_y)
                    row_hash[dir_x].delete(a*dir_x+dir_y)
                    row_hash.delete(dir_x) if row_hash[dir_x].size == 0
                end
                if col_hash.include?(dir_y) && col_hash[dir_y].include?(a*dir_x+dir_y)
                    col_hash[dir_y].delete(a*dir_x+dir_y)
                    col_hash.delete(dir_y) if col_hash[dir_y].size == 0
                end
                if f_dia_hash.include?(dir_x+dir_y) && f_dia_hash[dir_x+dir_y].include?(a*dir_x+dir_y)
                    f_dia_hash[dir_x+dir_y].delete(a*dir_x+dir_y)
                    f_dia_hash.delete(dir_x+dir_y) if f_dia_hash[dir_x+dir_y].size == 0
                end
                if b_dia_hash.include?(dir_x-dir_y) && b_dia_hash[dir_x-dir_y].include?(a*dir_x+dir_y)
                    b_dia_hash[dir_x-dir_y].delete(a*dir_x+dir_y)
                    b_dia_hash.delete(dir_x-dir_y) if b_dia_hash[dir_x-dir_y].size == 0
                end
            end
        end
        result
    end
end
