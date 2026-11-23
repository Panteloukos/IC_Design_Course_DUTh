v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -550 -120 -550 -90 {lab=Vdd}
N -210 -120 -210 -60 {lab=Vdd}
N -420 -120 -210 -120 {lab=Vdd}
N -210 20 -210 70 {lab=0}
N -550 -120 -420 -120 {lab=Vdd}
N -390 -20 -210 -20 {lab=Vin2}
N -250 -40 -210 -40 {lab=Vout}
N -250 -40 -250 260 {lab=Vout}
N -140 230 -140 270 {lab=Vout}
N -250 230 -140 230 {lab=Vout}
N -140 190 -140 230 {lab=Vout}
N -580 40 -500 40 {lab=Vin1}
N -320 -0 -210 -0 {lab=Vin1}
N -320 -0 -320 40 {lab=Vin1}
N -440 40 -320 40 {lab=Vin1}
N -390 80 -390 150 {lab=Vin2}
N -580 40 -580 120 {lab=Vin1}
N -390 -20 -390 80 {lab=Vin2}
N -290 100 -250 100 {lab=Vout}
N -390 100 -350 100 {lab=Vin2}
N -390 220 -390 240 {lab=#net1}
N -390 150 -390 160 {lab=Vin2}
N -500 40 -440 40 {lab=Vin1}
C {opamp_for_symbol.sym} -60 -20 0 0 {name=x1}
C {vsource.sym} -550 -60 0 0 {name=Vdd value=1.8 savecurrent=false}
C {gnd.sym} -550 -30 0 0 {name=l4 lab=0}
C {lab_pin.sym} -550 -120 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {gnd.sym} -210 70 0 0 {name=l1 lab=0}
C {vsource.sym} -390 270 0 0 {name=Vin1 value="SINE(0.9 0.005 40k)" savecurrent=false}
C {gnd.sym} -390 300 0 0 {name=l2 lab=0}
C {vsource.sym} -580 150 0 0 {name=Vin2 value=0.9 savecurrent=false}
C {gnd.sym} -580 180 0 0 {name=l3 lab=0
value="SINE(0.9 -0.05 40k)"}
C {capa.sym} -250 290 0 0 {name=CL
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -250 320 0 0 {name=l7 lab=0}
C {res.sym} -140 300 0 0 {name=R1
value=300k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -140 330 0 0 {name=l5 lab=0}
C {devices/code.sym} 380 -130 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {devices/code_shown.sym} 160 90 0 0 {name=NGSPICE
only_toplevel=true
value="
* Keep this option for Sky130 MOSFET binning
.option wnflag=1

.control
  * Save only your specific nets (faster & smaller .raw file than 'save all')
  save v(Vin1) v(Vin2) v(Vout) i(Vdd)

  * Run transient analysis: <step_size> <stop_time>
  * Example below: 10ns step up to 5us (good for a 1 MHz sine wave)
  tran 100n 500u

  * Option A: Open ngspice's built-in interactive plot window
  plot v(Vout)
  plot v(Vin1) v(Vin2)
	plot i(Vdd)
  * Option B: Write data to a .raw file so you can view it inside xschem
  *write tran_sim.raw
.endc
"}
C {lab_pin.sym} -140 190 0 0 {name=p2 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -580 70 0 0 {name=p3 sig_type=std_logic lab=Vin1}
C {lab_pin.sym} -390 80 0 0 {name=p4 sig_type=std_logic lab=Vin2}
C {res.sym} -320 100 1 0 {name=R2
value=30k
footprint=1206
device=resistor
m=1}
C {res.sym} -390 190 2 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
