#!/usr/bin/tclsh
set fruit_name {Apple Orange Mango Grapes}
set price {40 30 50 20}
set availability {2 3 4 5}
while { 1 } {
	puts "Fruits\t\tPrice(Rs.)\tQuantity(Kgs.)"
	set length [llength $fruit_name ]
	lmap l1 $fruit_name l2 $price l3 $availability {puts "$l1\t\t$l2\t\t$l3"}
	puts ""
	puts -nonewline "Enter Fruit Name : "
	flush stdout
	gets stdin name
	puts -nonewline "Enter Quantity   : "
	flush stdout
	gets stdin quantity
	set index [ lsearch $fruit_name $name ]
	puts "$index is"
	if { $index == -1 } {
	puts "$name not available."
	break
	}
	if { $quantity > [lindex $availability $index] } {
		puts "\nQuantity available for $name is [lindex $availability $index]. Please try again.\n"
		continue
	} else {
		set amount [expr [lindex $price $index] * $quantity ]
		lset availability $index [expr [lindex $availability $index] - $quantity ]
		puts "\nTotal Amount     : Rs.$amount\n\nRemaining Quantities :"
		lmap l1 $fruit_name l2 $availability {puts "$l1\t:\t$l2"}
		break
	}
}
