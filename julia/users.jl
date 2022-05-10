println(Base.active_project())
using Plots
x = 1:7
logocolors = Colors.JULIA_LOGO_COLORS
plot(x, [1, 2, 5, 30, 50, 150, 300], label = nothing, legend=:bottomright, xguidefontsize=10, yticks = nothing, xticks = nothing, margin=5Plots.mm, background_color = RGB(1,1,243/255), color = logocolors.purple)
xlabel!("Personal use ⟶ Publication ⟶ Reproducible ⟶ Reusable ⟶ Extensible")
ylabel!("Nr. User")
savefig("figures/users.pdf")
