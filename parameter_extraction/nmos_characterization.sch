v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -810 -80 -810 20 {lab=0}
N -920 -110 -920 -100 {lab=g}
N -920 -110 -850 -110 {lab=g}
N -810 -110 -610 -110 {lab=b}
N -610 -110 -610 -90 {lab=b}
N -810 -220 -710 -220 {lab=d}
N -810 -220 -810 -140 {lab=d}
N -880 -150 -880 -110 {lab=g}
N -640 -140 -630 -140 {lab=b}
N -630 -140 -630 -110 {lab=b}
C {devices/code_shown.sym} -60 -490 0 0 {name=NGSPICE
only_toplevel=true
value="
.lib /foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice tt
.param Lp=0.6 Wp=5
.save all @m.xm1.msky130_fd_pr__nfet_01v8[vth]

.control
set llist = ( 0.6 0.7 0.8 0.9 1.0 )
let W    = 5
let vov  = 0.2
let vgsb = 0.9
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
  alter Vd dc=0.9
  alter Vb dc=0
  dc Vg 0 1.8 0.005
  let id     = -i(Vd)
  let sqrtid = sqrt(id)
  let vth    = @m.xm1.msky130_fd_pr__nfet_01v8[vth]
  let kp     = 2*deriv(sqrtid)^2*$lv/W*1e6
  let gmid   = deriv(id)/id
  let vth_op = vth[160]
  set p_sq   = ( $p_sq \{$curplot\}.sqrtid )
  set p_kp   = ( $p_kp \{$curplot\}.kp )
  set p_vth  = ( $p_vth \{$curplot\}.vth )
  set p_gmid = ( $p_gmid \{$curplot\}.gmid )
  echo L = $lv um : model Vth = $&vth_op V

  let vg_out = vth_op + vov
  alter Vg dc=$&vg_out
  dc Vd 0 1.8 0.005
  let id  = -i(Vd)
  let gds = deriv(id)
  let lam = gds/(id - gds*v(d)+1e-15)
  set p_id  = ( $p_id \{$curplot\}.id )
  set p_lam = ( $p_lam \{$curplot\}.lam )

  alter Vg dc=$&vgsb
  alter Vd dc=0.9
  dc Vb 0 -0.9 -0.01
  let vth = @m.xm1.msky130_fd_pr__nfet_01v8[vth]
  set p_vsb = ( $p_vsb \{$curplot\}.vth )
end

plot $p_sq  xlabel 'VGS (V)' ylabel 'sqrt(ID)' title 'sqrt(ID) vs VGS'
plot $p_kp  xlimit 0.4 1.4 ylimit 0 300 xlabel 'VGS (V)' ylabel 'uCox (uA/V^2)' title 'local uCox'
plot $p_vth xlimit 0.3 1.4 xlabel 'VGS (V)' ylabel 'Vth (V)' title 'model Vth vs VGS'
plot $p_gmid xlimit 0.3 1.4 ylimit 0 30 xlabel 'VGS (V)' ylabel 'gm/ID (1/V)' title 'gm/ID'
plot $p_id  xlabel 'VDS (V)' ylabel 'ID (A)' title 'ID vs VDS at VGS = Vth + vov'
plot $p_lam xlimit 0.3 1.6 ylimit 0 0.3 xlabel 'VDS (V)' ylabel 'lambda (1/V)' title 'lambda vs VDS'
plot $p_vsb xlabel 'VB (V)  (VSB = -VB)' ylabel 'Vth (V)' title 'body effect'
.endc
"
}
C {vsource.sym} -920 -70 0 0 {name=Vg value=0.9 savecurrent=false}
C {gnd.sym} -810 20 0 0 {name=l1 lab=0}
C {gnd.sym} -920 -40 0 0 {name=l2 lab=0}
C {vsource.sym} -610 -60 0 0 {name=Vb value=0 savecurrent=false}
C {gnd.sym} -610 -30 0 0 {name=l3 lab=0}
C {vsource.sym} -710 -190 0 0 {name=Vd value=0.9 savecurrent=false}
C {gnd.sym} -710 -160 0 0 {name=l4 lab=0}
C {lab_pin.sym} -810 -190 0 0 {name=p1 sig_type=std_logic lab=d}
C {lab_pin.sym} -880 -150 0 0 {name=p2 sig_type=std_logic lab=g}
C {lab_pin.sym} -640 -140 0 0 {name=p3 sig_type=std_logic lab=b}
C {sky130_fd_pr/nfet_01v8.sym} -830 -110 0 0 {name=M1
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
model=nfet_01v8
spiceprefix=X
}
