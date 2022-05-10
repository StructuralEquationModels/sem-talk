using Plots
x = 1:7
spss = [1, 2, 3, 10, 10, 10, 10]
logocolors = Colors.JULIA_LOGO_COLORS
plot(x, spss, label = "SPSS", legend=:bottomright, xguidefontsize=10, xticks = nothing, yticks = nothing, margin=5Plots.mm, background_color = RGB(1,1,243/255), color = logocolors.red)
r = [2, 2.5, 3, 3.5, 4, 6, 10]
plot!(x, r, label = "R", color = logocolors.blue)
julia = 2.5:.5:5.5
plot!(x, julia, label = "Julia", color = logocolors.green)
xlabel!("Personal use ⟶ Publication ⟶ Reproducible ⟶ Reusable ⟶ Extensible")
ylabel!("Hobby ⟶ Part time ⟶ Full time")

savefig("figures/difficulty.pdf")

