using UnitfulHartree
using Base.Test
using Unitful

@testset "Check definitions" begin
    @test ustrip(1u"a₀" |> u"m") ≈  5.291772106712e-11
    @test ustrip(1u"rₑ" |> u"m") ≈  2.8179403227e-15
    @test ustrip(1u"kₑ" |> u"N*m^2*C^-2") ≈ 8.987_551_787_368_176_4e9
    @test ustrip(1u"ϵ₀" |> unit(u"ϵ0")) ≈ ustrip(u"ϵ0")
    @test ustrip(1u"Eₕ" |> u"Ry") ≈ 2
    @test ustrip(1u"Eₕ" |> u"J") ≈ 4.35974465054e-18
    @test ustrip(1u"Eₕ" |> u"eV") ≈ 27.2113860217
end
