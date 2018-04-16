set StdArithNoWarnings 1;

set sigs [find signals -r /*]
#set all_sigs [regexp -all -inline {\S+} $sigs]
set all_sigs [split $sigs]

for {set i 0} {$i < 1000000000000000} {incr i 100} {
    set should_run [expr { int(100*rand()) }]
    if {$should_run >= 50 } {

    	set pickle [expr { int([llength $all_sigs]*rand()) }]
    	set p [lindex $all_sigs $pickle]


    	if { (0 == [string match *vsim* $p]) && ([string match *start* $p] == 0) && (0 == [string match *finish* $p]) && (0 == [string match *reset* $p])} {
		puts "About to Modify $p"
		set which_bin [expr { int(rand()) }]
        	force $p $which_bin
    	} 
    }
    run 100ns;
}

# quit the simulation
quit -f
