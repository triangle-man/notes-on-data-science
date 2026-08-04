reset
# Thanks to Claude for help
set terminal cairolatex pdf size 7cm,5cm font " ,9" 
set output 'deriv-of-path.tex'

load "moreland.pal"

# set title "The path of $f(t)$ and its derivative"
unset key
set label '$\mathcal{W}$' at graph 0.05, 0.95 left
# set xlabel '$\mathcal{W}$'
set format x ""
set format y ""
set grid
set parametric

# --- The path, parameterised by t (with a couple of bends) ---
x(t) = 2*t + sin(3*t)
y(t) = sin(2*t) + 0.5*t

# --- Its derivative (the tangent/velocity vector) ---
dx(t) = 2 + 3*cos(3*t)
dy(t) = 2*cos(2*t) + 0.5

set trange [0:6]
set samples 400

# Shrink the derivative vectors so they sit nicely on the plot
scale = 0.3

set style arrow 1 head filled size 0.15,20 lw 2.5 lc rgb "red"

# Drop an arrow at evenly spaced points along the path
do for [i=0:12] {
    t0 = i*0.5
    x0 = x(t0)
    y0 = y(t0)
    set arrow from x0, y0 to x0 + scale*dx(t0), y0 + scale*dy(t0) as 1
}

plot x(t), y(t) with lines lw 1.5 lc rgb "blue"
