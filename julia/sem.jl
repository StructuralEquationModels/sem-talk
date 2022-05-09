using Pkg
Pkg.add(url = "https://github.com/StructuralEquationModels/StructuralEquationModels.jl")

using CSV, DataFrames, StructuralEquationModels, BenchmarkTools

data = DataFrame(CSV.File("data.csv"))

obs = Symbol.('t', 1:13)
lat = [:PS]

graph = @StenoGraph begin
    PS → fixed(1.0) * t1
    PS → _(Symbol.('t', 2:13))
    _(obs) ↔ _(obs)
    _(lat) ⇔ _(lat)
end

partable = ParameterTable(
    latent_vars = lat,
    observed_vars = obs,
    graph = graph
)

model = Sem(
    specification = partable,
    data = data
)

model_fit = sem_fit(model)
sem_summary(model_fit)


@benchmark sem_fit(model)
