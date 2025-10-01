let
# Serialised using Catalyst version v1.11.5.

# Independent variable:
@parameters t

# Parameters:
ps = @parameters k_1 k_2 k_3 k_4 k_5 k_6 k_7 k_8 k_9 k_10 k_11 k_12 k_13 k_14 k_15 k_16 p_1 p_2 p_3 μ η θ α

# Species:
sps = @species S_p(t) C(t) P(t) R(t) S_r(t) S_h(t) H(t) H_R(t) C_p(t) E(t) S_ci(t) C_f(t) C_e(t) C_L(t)

# Reactions:
rxs = [
	Reaction(μ, nothing, [S_ci], nothing, [1]),
	Reaction(α, nothing, [H], nothing, [1]),
	Reaction(k_1, [S_ci], [S_ci, S_r, S_h, S_p], [1], [1, 1, 1, 1]),
	Reaction(p_1, [S_r], [S_r, R], [1], [1, 1]),
	Reaction(p_2, [S_h], [S_h, H_R], [1], [1, 1]),
	Reaction(p_3, [S_p], [S_p, P], [1], [1, 1]),
	Reaction(C_L*k_3, [R], [R, C_f], [1], [1, 1]),
	Reaction(k_14, [P, R], [P], [1, 1], [1]),
	Reaction(k_4, [C_f], [C_p], [1], [1]),
	Reaction(k_5, [C_p], [C_e], [1], [1]),
	Reaction(k_6, [C_e], [C_p], [1], [1]),
	Reaction(k_7, [C_e], [E], [1], [1]),
	Reaction(k_8, [E], [C_e], [1], [1]),
	Reaction(k_9, [H, H_R], [H_R, C_e], [1, 1], [1, 1]),
	Reaction(k_15, [C_e, H_R], [C_e], [1, 1], [1]),
	Reaction(θ, [C_e], [C_e, C], [1], [1, 1]),
	Reaction(η, [S_ci, C], nothing, [1, 1], nothing),
	Reaction(k_2, [S_r], nothing, [1], nothing),
	Reaction(k_10, [S_h], nothing, [1], nothing),
	Reaction(k_13, [S_p], nothing, [1], nothing),
	Reaction(k_11, [R], nothing, [1], nothing),
	Reaction(k_12, [C_e], nothing, [1], nothing),
	Reaction(k_16, [P], nothing, [1], nothing)
]

# Discrete events:
discrete_events = [
	(t == 50) => [C_L ~ 0.5 + C_L],
	(t == 100) => [C_L ~ 0.5 + C_L],
	(t == 150) => [C_L ~ -0.5 + C_L],
	(t == 200) => [C_L ~ -0.5 + C_L]
]

# Declares ReactionSystem model:
rs = ReactionSystem(rxs, t, sps, ps; name = :Cholesterol_RN, discrete_events)
complete(rs)

end