__precompile__(true)
module UnitfulHartree
import Unitful
using Unitful: @unit, upreferred, @u_str, ħ, c, dimension, basefactors


@unit mₑ "mₑ" ElectronMass 9.1093835611e-31*u"kg" false
@unit e₀ "eₒ" ElementaryCharge 1.602176620898e-19*u"C" false
@unit kₑ "kₑ" CoulombForceConstant 8.9875517873681e9*u"kg*m^3*s^-2*C^-2" false
@unit α "α" FineStructureConstant upreferred(e₀^2*kₑ/(1c*ħ)) false
@unit a₀ "a₀" BohrRadius upreferred(ħ^2/(1kₑ*mₑ*e₀^2)) false
@unit Eₕ "Eₕ" HartreeEnergy upreferred(mₑ*e₀^4*kₑ^2/(1ħ^2)) true
@unit Ry "Ry" RydbergEnergy 0.5*Eₕ true
@unit rₑ "rₑ" ClassicalElectronRadius upreferred((1e₀^2*kₑ)/(1mₑ*c^2)) false
@unit mₚ  "mₚ" ProtonMass 1836.15mₑ false
@unit μ_b  "μ_b" BohrMagneton upreferred(e₀*ħ/(2mₑ)) false


# Some gymnastics required here because if we precompile, we cannot add to
# Unitful.basefactors at compile time and expect the changes to persist to runtime.
const localunits = Unitful.basefactors
function __init__()
    merge!(Unitful.basefactors, localunits)
    Unitful.register(UnitfulHartree)
end


end # module
