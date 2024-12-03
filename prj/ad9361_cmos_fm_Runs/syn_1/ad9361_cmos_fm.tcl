# Script Created by Tang Dynasty.
proc step_begin { step } {
  set stopFile ".stop.f"
  if {[file isfile .stop.f]} {
    puts ""
    puts " #Halting run"
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.f"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exists ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exists ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Ownner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}
proc step_end { step } {
  set endFile ".$step.end.f"
  set ch [open $endFile w]
  close $ch
}
proc step_error { step } {
  set errorFile ".$step.error.f"
  set ch [open $errorFile w]
  close $ch
}
step_begin opt_rtl
set ACTIVESTEP opt_rtl
set rc [catch {
  import_device dr1_90.db -package DR1M90GEG484 -speed 2
  open_project {ad9361_cmos_fm.prj} -noanalyze
  import_db {ad9361_cmos_fm_elaborate.db}
  commit_param -step rtl
  read_adc ../../ad9361.adc
  optimize_rtl
  report_area -file ad9361_cmos_fm_rtl.area
  export_db {ad9361_cmos_fm_rtl.db}
} RESULT]
if {$rc} {
  step_error opt_rtl
  return -code error $RESULT
} else {
  step_end opt_rtl
  unset ACTIVESTEP
}
