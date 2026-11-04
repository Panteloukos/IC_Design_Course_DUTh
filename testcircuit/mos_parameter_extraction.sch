v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -200 -150 -90 -150 {lab=g_n}
N -200 -150 -200 -130 {lab=g_n}
N -50 -270 -50 -180 {lab=d_n}
N -120 -270 -50 -270 {lab=d_n}
N 50 -150 50 -140 {lab=b_n}
N -200 160 -90 160 {lab=g_p}
N -200 160 -200 180 {lab=g_p}
N 50 160 50 170 {lab=b_p}
N -50 160 50 160 {lab=b_p}
N -50 190 -50 250 {lab=d_p}
N -110 -150 -110 -120 {lab=g_n}
N -130 130 -110 130 {lab=g_p}
N -110 130 -110 160 {lab=g_p}
N 50 110 50 160 {lab=b_p}
N -50 -150 140 -150 {lab=b_n}
N 140 -210 140 -150 {lab=b_n}
C {sky130_fd_pr/nfet_01v8.sym} -70 -150 0 0 {name=M1
W=1
L=0.8
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -70 160 0 0 {name=M2
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -200 -100 0 0 {name=Vg_n value=0 savecurrent=false}
C {gnd.sym} -200 -70 0 0 {name=l1 lab=0}
C {devices/code.sym} 980 -390 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {gnd.sym} -50 -120 0 0 {name=l2 lab=0}
C {vsource.sym} -120 -240 0 0 {name=Vd_n value=0 savecurrent=false}
C {gnd.sym} -120 -210 0 0 {name=l3 lab=0}
C {vsource.sym} 50 -110 0 0 {name=Vb_n value=0 savecurrent=false}
C {gnd.sym} 50 -80 0 0 {name=l4 lab=0}
C {vsource.sym} -200 210 0 0 {name=Vg_p value=0 savecurrent=false}
C {gnd.sym} -200 240 0 0 {name=l5 lab=0}
C {gnd.sym} -50 130 2 0 {name=l6 lab=0}
C {vsource.sym} -50 280 0 0 {name=Vd_p value=0 savecurrent=false}
C {gnd.sym} -50 310 0 0 {name=l7 lab=0}
C {vsource.sym} 50 200 0 0 {name=Vb_p value=0 savecurrent=false}
C {gnd.sym} 50 230 0 0 {name=l8 lab=0}
C {devices/code_shown.sym} -770 -370 0 0 {name=NGSPICE
only_toplevel=true
*spice_ignore=true
value="* this option enables mos model bin 
* selection based on W/NF instead of W

*FOR NMOS.
.control
alter Vd_n 0.05
dc Vg_n 0 1.8 0.005
let vgs = v(g_n)
let id = abs(i(Vd_n))
dc Vg_n 0.9 1.1 0.005
let x = v(g_n)
let y = abs(i(Vd_n))
let xm = mean(x)
let ym = mean(y)
let slope = mean((x-xm)*(y-ym))/mean((x-xm)*(x-xm))
let vgs0 = xm - ym/slope
let vth = vgs0 - 0.05/2
print slope vgs0 vth
let fit = slope*(dc1.vgs-vgs0)
let idmax = vecmax(dc1.id)
plot dc1.id fit vs dc1.vgs ylimit 0 $&idmax
.endc
" }
C {lab_pin.sym} -110 -120 0 0 {name=p1 sig_type=std_logic lab=g_n}
C {lab_pin.sym} -50 -220 0 0 {name=p2 sig_type=std_logic lab=d_n}
C {lab_pin.sym} -130 130 0 0 {name=p4 sig_type=std_logic lab=g_p}
C {lab_pin.sym} 50 110 0 0 {name=p5 sig_type=std_logic lab=b_p}
C {lab_pin.sym} -50 220 0 0 {name=p6 sig_type=std_logic lab=d_p}
C {lab_pin.sym} 140 -210 0 0 {name=p3 sig_type=std_logic lab=b_n}
C {devices/code_shown.sym} -780 120 0 0 {name=NGSPICE1
only_toplevel=true
spice_ignore=true
value="* this option enables mos model bin 
* selection based on W/NF instead of W

*FOR PMOS

.control
alter Vd_p -0.05
dc Vg_p 0 -1.8 -0.005
let vgs = -v(g_p)
let id = abs(i(Vd_p))
dc Vg_p -1.0 -1.3 -0.005
let x = -v(g_p)
let y = abs(i(Vd_p))
let xm = mean(x)
let ym = mean(y)
let slope = mean((x-xm)*(y-ym))/mean((x-xm)*(x-xm))
let vgs0 = xm - ym/slope
let vth = vgs0 - 0.05/2
print slope vgs0 vth
let fit = slope*(dc1.vgs-vgs0)
let idmax = vecmax(dc1.id)
plot dc1.id fit vs dc1.vgs ylimit 0 $&idmax
.endc
" }
