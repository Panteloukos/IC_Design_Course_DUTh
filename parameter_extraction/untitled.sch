v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 30 -100 60 {lab=#net1}
N 100 30 100 60 {lab=#net1}
N -10 60 100 60 {lab=#net1}
N -100 60 -10 60 {lab=#net1}
N -0 60 -0 110 {lab=#net1}
N -100 -140 -100 -30 {lab=#net2}
N 100 -140 100 -30 {lab=#net3}
N -100 -240 -100 -200 {lab=Vdd}
N -100 -240 100 -240 {lab=Vdd}
N 100 -240 100 -200 {lab=Vdd}
N 100 -240 300 -240 {lab=Vdd}
N 300 -240 300 -200 {lab=Vdd}
N 300 -140 300 110 {lab=#net4}
N 100 -60 200 -60 {lab=#net3}
N 260 -60 300 -60 {lab=#net4}
N 160 -170 260 -170 {lab=#net3}
N 160 -170 160 -60 {lab=#net3}
N -0 170 0 200 {lab=0}
N 300 170 300 200 {lab=0}
N -290 170 -290 200 {lab=0}
N -360 140 -330 140 {lab=#net5}
N -360 80 -360 140 {lab=#net5}
N -360 80 -290 80 {lab=#net5}
N -290 80 -290 110 {lab=#net5}
N -0 140 40 140 {lab=0}
N 40 140 40 180 {lab=0}
N 0 180 40 180 {lab=0}
N 300 140 350 140 {lab=0}
N 300 180 350 180 {lab=0}
N 350 140 350 180 {lab=0}
N -290 140 -260 140 {lab=0}
N -260 140 -260 180 {lab=0}
N -290 180 -260 180 {lab=0}
N -180 140 -40 140 {lab=#net5}
N -180 100 -180 140 {lab=#net5}
N -290 90 -180 90 {lab=#net5}
N -180 90 240 90 {lab=#net5}
N 240 100 240 140 {lab=#net5}
N 240 140 260 140 {lab=#net5}
N -180 90 -180 100 {lab=#net5}
N 240 90 240 100 {lab=#net5}
N -290 -60 -290 80 {lab=#net5}
N -290 -240 -290 -120 {lab=Vdd}
N -290 -240 -100 -240 {lab=Vdd}
N -680 10 -680 40 {lab=Vdd}
N -180 -0 -140 0 {lab=VinP}
N 140 -0 180 0 {lab=VinN}
N -530 10 -530 40 {lab=VinN}
N -600 10 -600 40 {lab=VinP}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8_lvt.sym} -120 0 0 0 {name=M1
W=\{Wp\}
L=0.8
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -80 -170 0 1 {name=M3
W=\{Wp\}
L=0.8
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
C {sky130_fd_pr/nfet_01v8.sym} -20 140 0 0 {name=M5
W=\{Wp\}
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
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8_lvt.sym} 120 0 0 1 {name=M2
W=\{Wp\}
L=0.8
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 80 -170 0 0 {name=M4
W=\{Wp\}
L=0.8
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
C {sky130_fd_pr/nfet_01v8.sym} 280 140 0 0 {name=M6
W=\{Wp\}
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
C {sky130_fd_pr/pfet_01v8.sym} 280 -170 0 0 {name=M7
W=\{Wp\}
L=0.8
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
C {sky130_fd_pr/cap_mim_m3_1.sym} 230 -60 3 0 {name=C1 model=cap_mim_m3_1 W=25 L=30 MF=1 spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} -310 140 0 0 {name=M8
W=\{Wp\}
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
C {vsource.sym} -680 70 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 0 200 0 0 {name=l1 lab=0}
C {gnd.sym} 300 200 0 0 {name=l2 lab=0}
C {gnd.sym} -290 200 0 0 {name=l3 lab=0}
C {isource.sym} -290 -90 0 0 {name=I0 value=1m}
C {gnd.sym} -680 100 0 0 {name=l4 lab=0}
C {lab_pin.sym} -680 10 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -290 -240 0 0 {name=p2 sig_type=std_logic lab=Vdd}
C {vsource.sym} -600 70 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -600 100 0 0 {name=l5 lab=0}
C {vsource.sym} -530 70 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -530 100 0 0 {name=l6 lab=0}
C {lab_pin.sym} -600 10 0 0 {name=p3 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -180 0 0 0 {name=p4 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -530 10 0 0 {name=p5 sig_type=std_logic lab=VinN}
C {lab_pin.sym} 180 0 0 1 {name=p6 sig_type=std_logic lab=VinN}
