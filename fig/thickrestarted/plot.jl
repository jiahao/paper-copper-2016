using Gadfly

Θs = readcsv("thetas.txt")
is = readcsv("is.txt")
macrois = readcsv("macrois.txt")

p = plot(
Guide.xlabel("Iteration"), Guide.ylabel("Ritz values"),
Coord.Cartesian(xmax=120),
layer(Geom.point, x=is, y=Θs,
    Theme(default_point_size=1.75px, default_color=colorant"black", highlight_width=0px)
),
layer(Geom.vline, xintercept = macrois,
    Theme(default_color=colorant"grey")
),
)
draw(PDF("fig-conv.pdf", 8inch, 6inch), p)
