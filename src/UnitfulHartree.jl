__precompile__(true)
module UnitfulHartree
using Unitful
import Unitful

@unit mₑ "mₑ" ElectronMass 9.1093835611e-31*u"kg" false
@unit e₀ "eₒ" ElementaryCharge 1.602176620898e-19*u"C" false
@unit kₑ "kₑ" CoulombForceConstant 1/(4π)u"ϵ0" false
@unit ħ "ħ" ReducedPlanckConstant Unitful.ħ false
@unit a₀ "a₀" BohrRadius 1ħ^2/(1kₑ*mₑ*e₀^2) false
@unit Eₕ "Eₕ" HartreeEnergy mₑ*e₀^4*kₑ^2/(1ħ^2) true
@unit Ry "Ry" RydbergEnergy 0.5Eₕ true
@unit rₑ "rₑ" ClassicalElectronRadius 1e₀^2*kₑ/(1mₑ*Unitful.c^2) false
const α = 1e₀^2*1kₑ/(1Unitful.c*ħ)
const mₚ = 1836.15mₑ
const μ_b = e₀*ħ/(2mₑ)
const ϵ₀ = 1/(4π*kₑ)


# Some gymnastics required here because if we precompile, we cannot add to
# Unitful.basefactors at compile time and expect the changes to persist to runtime.
const localunits = Unitful.basefactors
function __init__()
    merge!(Unitful.basefactors, localunits)
    Unitful.register(UnitfulHartree)
end


end # module
