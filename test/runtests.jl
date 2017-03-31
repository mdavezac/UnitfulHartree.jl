using UnitfulHartree
using Base.Test
using Unitful

@test unit(upreferred(1u"𝖊")) == u"𝖊"
@test ustrip(1u"a₀" |> u"m") ≈  5.291772106712e-11
