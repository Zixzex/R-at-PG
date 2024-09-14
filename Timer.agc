global Timers as float[0]

//returns the timer ID
function CreateTimer()
	
	tmp# = GetSeconds()
	Timers.insert(tmp#)
	
endfunction Timers.length

`resets the timer of the ID given	
function TimerReset(ID as integer)
	
	tmp# = GetSeconds()
	Timers[ID] = tmp#
	
endfunction

`returns the time of the timer
function TimerTime(ID as integer)
	
	t# = abs((Timers[ID] - GetSeconds()))
	
endfunction t# 

`resets all timers including the AGK one
function ResetAllTimers()
	
	ResetTimer()
	for x = 0 to Timers.length
		Timers[x] = GetSeconds()
	next x
	
endfunction

function DeleteAlltimers()
	
	for x = 0 to Timers.length
		Timers.Remove(x)
	next x
	
endfunction