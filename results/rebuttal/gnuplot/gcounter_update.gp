load 'defaults.gp'
load 'cdtudcolors.gp'
load 'colors-sequential-Gray.gp'

unset label 200
unset label 100


set xlabel "Throughput (ops/s * 10)"
set ylabel "Latency (ms)" offset screen 0.05,0

baseline_name = "Baseline"
system_name = "SMPC"

baseline_color = HKS44_100
system_color = HKS65_100

marker_1 = 6
marker_2 = 2

line_style = 5
line_width = 1
point_size = 1


#set terminal postscript eps enhanced color
set terminal epslatex color dl 2.0 size 3.5,2.5

set output "plots/gcounter_update.tex"

set autoscale y
set autoscale x

set key horiz maxrows 1 samplen 1 
set key out top center

set ytics 40, .2


plot "results/BASELINE/gcounter/update.dat" using ($1/10):2 with linespoints title baseline_name ls line_style lw line_width pt marker_1 ps point_size lc rgb baseline_color,\
	"results/SMPC/gcounter/update.dat" using ($1/10):2 with linespoints title system_name ls line_style lw line_width pt marker_2 ps point_size lc rgb system_color


unset multiplot

