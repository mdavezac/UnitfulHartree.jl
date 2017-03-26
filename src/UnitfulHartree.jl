__precompile__(true)
module UnitfulHartree
import Unitful
using Unitful: @unit, uconvert, @u_str, ħ


@unit alpha "α" FineStructureConstant 1/137.03599913931 false
@unit mₑ "mₑ" ElectronMass 9.1093835611e-31*u"kg" false
@unit e₀ "eₒ" ElementaryCharge 1.602176620898e-19*u"C" false
# @unit ħ  "ħ" ReducedPlanckConstance 6.58211951440e-16*u"eV*s" false
@unit kₑ "kₑ" CoulombForceConstant 8.9875517873681e9 *u"kg*m^3*s^-2*C^-2" false
# @unit a₀ "a₀" BohrRadius uconvert(ħ^2/(kₑ*mₑ*e₀^2), 1u"m") false
# @unit Eₕ "Eₕ" HartreeEnergy uconvert(mₑ*e₀^4*kₑ^2/ħ^2, 1u"J") true
# @unit Ry "Ry" RydbergEnergy 0.5*Eₕ true
# @unit c  "c" SpeedOfLight uconvert(e₀^2*kₑ/(α*ħ)) false
# @unit rₑ  "rₑ" ClassicalElectronRadius uconvert(e₀^2*kₑ/(mₑ*c^2)) false
# @unit mₚ  "mₚ" ProtonMass 1836.15mₑ false
# @unit μB  "μB" BohrMagneton unconvert(e₀*ħ/mₑ, 1u"A*m^2") false


# Some gymnastics required here because if we precompile, we cannot add to
# Unitful.basefactors at compile time and expect the changes to persist to runtime.
const localunits = Unitful.basefactors
function __init__()
    merge!(Unitful.basefactors, localunits)
    Unitful.register(UnitfulHartree)
end


end # module
