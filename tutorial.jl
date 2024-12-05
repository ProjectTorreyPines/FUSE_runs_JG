using Pkg
using BenchmarkTools
using Revise
Pkg.activate(".")

Pkg.add("FUSE")
Pkg.add("Plots")
using Plots # for plotting
using FUSE

ini, act = FUSE.case_parameters(:KDEMO);
ini.equilibrium.B0 = 7.8
ini.equilibrium.R0 = 6.5;
act.ActorCoreTransport.model = :FluxMatcher;
dd = IMAS.dd() # an empty dd
FUSE.init(dd, ini, act);
@checkin :init dd ini act