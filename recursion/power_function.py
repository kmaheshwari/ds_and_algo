class Solution:
    # Implement Power Function
    # Implement pow(x, n) % d. In other words, given x, n and d, find (xn % d) Note that remainders on division cannot be negative. In other words, make sure the answer you return is non negative.
    # Input : x = 2, n = 3, d = 3
    # Output : 2

    # 2^3 % 3 = 8 % 3 = 2.
    # @param x : integer
    # @param n : integer
    # @param d : integer
    # @return an integer
    def pow(self, x, n, d):
        def recur_pow(x, n):
            if x == 0: return 0
            if n == 0: return 1
            res = 0
            if n % 2 == 0:
                pow_n_by_2 = recur_pow(x,n/2)
                # if even: (a ^ b) % c = ((a ^ b/2) * (a ^ b/2))%c
                res = (pow_n_by_2*pow_n_by_2)%d
            else:
                # property: (m * n) % p =((m % p) * (n % p)) % p
                # if odd: (a ^ b) % c = (a * (a ^( b-1))%c
                mult = recur_pow(x,n-1)%d
                res = ((x%d)*mult)%d
            # mod of negative number = (n + d)%d
            return (res+d)%d
        res = recur_pow(x, n)
        return res
