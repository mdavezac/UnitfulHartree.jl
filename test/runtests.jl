using UnitfulHartree
using Base.Test
using Unitful

@test unit(upreferred(1u"𝐞")) == u"𝐞"
@test ustrip(1u"a₀" |> u"m") ≈  5.291772106712e-11
