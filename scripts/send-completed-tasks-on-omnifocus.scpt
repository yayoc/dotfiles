set todayDate to current date
set todayTime to time of todayDate

set lastWeekDate to todayDate - (6 * days) - todayTime

set recipientName to "yayoc"
set recipientAddress to "hi@yayoc.com"
set emailSubject to "Weekly Review (" & short date string of (lastWeekDate) & "-" & short date string of (todayDate - todayTime) & ")"
set emailContent to ""

set TEMP_FILE to "/tmp/foo.txt"

tell application "OmniFocus"
	tell default document
		set refDoneLastWeek to a reference to (flattened tasks where (completion date ≥ lastWeekDate))
		set {lstName, lstProject, lstCompletionDate} to {name, name of its containing project, completion date} of refDoneLastWeek
		
		set n to count of refDoneLastWeek
		
		repeat with i from 1 to count of lstName
			set {strName, strProject, strCompletionDate} to {item i of lstName, item i of lstProject, item i of lstCompletionDate}
			set listItem to "* " & short date string of (strCompletionDate) & " " & strName & " (" & strProject & ") 
"
			set emailContent to emailContent & listItem
		end repeat
		
		-- sort by completion date 
		set F to TEMP_FILE as POSIX file
		set F to open for access F with write permission
		write emailContent & return to F
		close access F
		set emailContent to do shell script "sort -r " & TEMP_FILE
		do shell script "rm " & TEMP_FILE
		
		set emailContent to "Completed: " & n & " tasks 
" & emailContent
		log emailSubject
		log emailContent
	end tell
end tell


tell application "Mail"
	set theMessage to make new outgoing message with properties {subject:emailSubject, content:emailContent, visible:true}
	tell theMessage
		make new to recipient with properties {name:recipientName, address:recipientAddress}
		send
	end tell
end tell
