function svd_gkl(A, q; maxiter=minimum(size(A)))
    m, n = size(A)
    T = eltype(A)
    Tr = typeof(one(T)/norm([one(T)]))

    αs = Tr[]
    βs = Tr[]
    P = zeros(T, m, 0)
    Q = [q]

    β = zero(Tr)
    p = zeros(size(A, 1))
    for iter in 1:maxiter
        p = A*q - β*p
        α = norm(p)
        p = p/α
        push!(αs, α)
        P = [P p]

        q = A'p - α*q
        β = norm(q)
        q = q/β
        push!(βs, β)
        Q = [Q q]
    end

    B = Bidiagonal(αs, βs[1:maxiter-1], true)
    F = svdfact(B)
    LinAlg.SVD(P*F[:U], F[:S], F[:Vt]*Q[:,1:maxiter]')
end

m = 10
n = 20
A = zeros(m, n)
for i=1:min(m, n)
    A[i, i] = i
end
q = ones(n)/√n
svd_gkl(A, q)
