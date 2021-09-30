BEGIN{
	match("abcdefg",/(.)(.)./, arr)
	print RSTART,RLENGTH
	for(i in arr)
	print "arr[" i "] = ",arr[i]
}
