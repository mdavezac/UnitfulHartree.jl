__precompile__(true)
module UnitfulHartree
using Unitful
import Unitful

Unitful.@dimension 𝐄 "𝐄" Electron # \mbfE
Unitful.@refunit 𝖊 "𝖊" Electronish 𝐄 false # \mbffrake
Unitful.@derived_dimension Wavefunction 𝐄^(1//2)

@unit mₑ "mₑ" ElectronMass 9.1093835611e-31*u"kg" false
@unit e₀ "eₒ" ElementaryCharge 1.602176620898e-19*u"C" false
@unit kₑ "kₑ" CoulombForceConstant 8.9875517873681e9*u"kg*m^3*s^-2*C^-2" false
@unit ħ "ħ" ReducedPlanckConstant Unitful.ħ false
@unit a₀ "a₀" BohrRadius uconvert(u"m", 1ħ^2/(1kₑ*mₑ*e₀^2)) false
@unit Eₕ "Eₕ" HartreeEnergy uconvert(u"J", mₑ*e₀^4*kₑ^2/(1ħ^2)) true
@unit Ry "Ry" RydbergEnergy 0.5*Eₕ true
@unit c "c" SpeedOfLight Unitful.c false
@unit rₑ "rₑ" ClassicalElectronRadius uconvert(u"m", (1e₀^2*kₑ)/(1mₑ*c^2)) false
@unit ρ₃ "ρ₃" ElectronDensity3D 1𝖊*1a₀^-3 false
const α = 1e₀^2*1kₑ/(1c*ħ)
const mₚ = 1836.15mₑ
const μ_b = e₀*ħ/(2mₑ)


# Some gymnastics required here because if we precompile, we cannot add to
# Unitful.basefactors at compile time and expect the changes to persist to runtime.
const localunits = Unitful.basefactors
const localpromotion = Unitful.promotion
function __init__()
    merge!(Unitful.basefactors, localunits)
    merge!(Unitful.promotion, localpromotion)
    Unitful.register(UnitfulHartree)
end


end # module
