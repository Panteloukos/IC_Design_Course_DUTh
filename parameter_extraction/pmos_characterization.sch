v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -60 -40 140 -40 {lab=b}
N 140 -40 140 -20 {lab=b}
N -60 -150 -60 -70 {lab=vdd}
N -130 -80 -130 -40 {lab=g}
N 110 -70 120 -70 {lab=b}
N 120 -70 120 -40 {lab=b}
N -380 -70 -380 -40 {lab=vdd}
N -380 -70 -320 -70 {lab=vdd}
N -330 -90 -330 -70 {lab=vdd}
N -200 -40 -100 -40 {lab=g}
N -200 -60 -200 -40 {lab=g}
N -250 -120 -200 -120 {lab=vdd}
N 140 40 140 80 {lab=vdd}
N 100 80 140 80 {lab=vdd}
N -60 -10 -60 70 {lab=d}
N -60 70 -60 80 {lab=d}
N -120 80 -60 80 {lab=d}
N -150 80 -120 80 {lab=d}
N -200 20 -150 20 {lab=vdd}
N -80 30 -60 30 {lab=d}
C {vsource.sym} -200 -90 0 0 {name=Vsg value=0.9 savecurrent=false}
C {vsource.sym} 140 10 0 0 {name=Vbs value=0 savecurrent=false}
C {lab_pin.sym} -60 -120 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -130 -80 0 0 {name=p2 sig_type=std_logic lab=g}
C {lab_pin.sym} 110 -70 0 0 {name=p3 sig_type=std_logic lab=b}
C {sky130_fd_pr/pfet_01v8.sym} -80 -40 0 0 {name=M1
W=\{Wp\}
L=\{Lp\}
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
C {devices/code_shown.sym} 280 -200 0 0 {name=NGSPICE
only_toplevel=true
value="
.lib /foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice tt
.param Lp=0.6 Wp=5
.save all @m.xm1.msky130_fd_pr__pfet_01v8[vth]

.control
set llist = ( 0.6 0.7 0.8 0.9 1.0 )
let W    = 5
let vov  = 0.2
let vsgb = 1.2
set color0=white
set xbrushwidth=2
set p_sq  = ( )
set p_kp  = ( )
set p_vth = ( )
set p_gmid = ( )
set p_lam = ( )
set p_id  = ( )
set p_vsb = ( )

foreach lv $llist
  alterparam Lp = $lv
  reset
  alter Vsd dc=0.9
  alter Vbs dc=0
  dc Vsg 0 1.8 0.005
  let id     = -i(Vsd)
  let sqrtid = sqrt(id)
  let vth    = abs(@m.xm1.msky130_fd_pr__pfet_01v8[vth])
  let kp     = 2*deriv(sqrtid)^2*$lv/W*1e6
  let gmid   = deriv(id)/id
  let vth_op = vth[220]
  set p_sq   = ( $p_sq \{$curplot\}.sqrtid )
  set p_kp   = ( $p_kp \{$curplot\}.kp )
  set p_vth  = ( $p_vth \{$curplot\}.vth )
  set p_gmid = ( $p_gmid \{$curplot\}.gmid )
  echo L = $lv um : model abs Vth = $&vth_op V

  let vg_out = vth_op + vov
  alter Vsg dc=$&vg_out
  dc Vsd 0 1.8 0.005
  let id  = -i(Vsd)
  let gds = deriv(id)
  let lam = gds/(id - gds*(v(vdd)-v(d))+1e-15)
  set p_id  = ( $p_id \{$curplot\}.id )
  set p_lam = ( $p_lam \{$curplot\}.lam )

  alter Vsg dc=$&vsgb
  alter Vsd dc=0.9
  dc Vbs 0 0.9 0.01
  let vth = abs(@m.xm1.msky130_fd_pr__pfet_01v8[vth])
  set p_vsb = ( $p_vsb \{$curplot\}.vth )
end

plot $p_sq  xlabel 'VSG (V)' ylabel 'sqrt(ID)' title 'sqrt(ID) vs VSG'
plot $p_kp  xlimit 0.3 1.8 ylimit 0 100 xlabel 'VSG (V)' ylabel 'upCox (uA/V^2)' title 'local upCox'
plot $p_vth xlimit 0.3 1.8 xlabel 'VSG (V)' ylabel 'abs Vth (V)' title 'model abs Vth vs VSG'
plot $p_gmid xlimit 0.3 1.8 ylimit 0 30 xlabel 'VSG (V)' ylabel 'gm/ID (1/V)' title 'gm/ID'
plot $p_id  xlabel 'VSD (V)' ylabel 'ID (A)' title 'ID vs VSD at VSG = abs Vth + vov'
plot $p_lam xlimit 0.3 1.6 ylimit 0 0.3 xlabel 'VSD (V)' ylabel 'lambda (1/V)' title 'lambda vs VSD'
plot $p_vsb xlabel 'abs VSB (V)' ylabel 'abs Vth (V)' title 'body effect'
.endc
"
}
C {vsource.sym} -380 -10 0 0 {name=Vdd value=1.8 savecurrent=false}
C {gnd.sym} -380 20 0 0 {name=l5 lab=0}
C {lab_pin.sym} -330 -90 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -250 -120 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 100 80 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {vsource.sym} -150 50 0 0 {name=Vsd value=0.9 savecurrent=false}
C {lab_pin.sym} -200 20 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -80 30 0 0 {name=p8 sig_type=std_logic lab=d}
