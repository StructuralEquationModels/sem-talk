println(Base.active_project())
using Plots
x = 1:7
spss = [1, 2, 3, 10, 10, 10, 10]
logocolors = Colors.JULIA_LOGO_COLORS
plot(x, spss, label = "SPSS", legend=:bottomright, xguidefontsize=10, xticks = nothing, yticks = nothing, linewidth = 2, margin=10Plots.mm, background_color = RGB(1,1,243/255), color = logocolors.red)
r = [2, 2.5, 3, 3.5, 4, 6, 10]
plot!(x, r, label = "R", color = logocolors.blue, linewidth = 2)
julia = 2.5:.5:5.5
plot!(x, julia, label = "Julia", color = logocolors.green, linewidth = 2)
xlabel!("Personal use ⟶ Publication ⟶ Reproducible ⟶ Reusable ⟶ Extensible")
ylabel!("Hobby ⟶ Part time ⟶ Full time")

savefig("figures/difficulty.pdf")

