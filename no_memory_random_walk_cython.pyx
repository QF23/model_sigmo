import math
import random

def random_walk(double gamma,double beta,int time,int W,int M,int M_W,int alloc,int both_mechs):

    cdef int i, k, N, site_call, occ, count, countdown, N_M
    cdef double f, phi, P, x, x_occ, erased, M_inv, coin_add, coin_site, dice

    N = 0
    M_inv = 1. / float(M)
    x = float(N) * M_inv
    N_tot = []
    N_M = 0
    site_call = 0
    count = 0
    countdown = 0

    for i in xrange(time):
      
        if (alloc == 0) & (both_mechs == 0):
            coin_site=1.
        else:
            coin_site = random.uniform(0,1)
            coin_add = random.uniform(0,1)

        if coin_site > 0.5:
            site_call += 1
            if (alloc == 1) & (both_mechs == 0):
                f = x
            else:
                f = (x + gamma) / (1. + gamma)
            if f == 1.:
                P = 1.
            elif f != 0.:           
                phi = (2 * f - 1) / math.sqrt(f * (1 - f))
                P = 0.5 * (1 + math.tanh(beta * phi))
            else:
                P = 0.0
            dice = random.uniform(0,1)
            if P > dice:
                N += 1
                N_M += 1
            erased = random.uniform(0,1)
            if erased < x:
                N -= 1
            x = float(N) * M_inv
        else :
            if coin_add < gamma:
                N += 1
                erased = random.uniform(0,1)
                if erased < x:
                    N -= 1
                x = float(N) * M_inv

        if i != 0:
            if i % M_W == 0:
                x_occ = float(N_M) / float(site_call)
                N_tot.append(x_occ)
                N_M = 0
                site_call = 0
                if (x_occ > (1. - M_inv)):
                    count = 1
                if count == 1:
                    countdown += 1
                if countdown > W + 1:
                        break

    N_W = []

    for k in range(len(N_tot) - (W - 1)):
        N_W.append((sum(N_tot[k:k+W])) / float(W))

    return N_W
