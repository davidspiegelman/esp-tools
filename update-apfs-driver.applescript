-- Update APFS Driver
-- Written by David Spiegelman
--
-- This script does the following:
-- 1. Mounts your EFI partition on your boot disk
-- 2. Copy /usr/standalone/i386/apfs.efi to /Volumes/EFI/EFI/CLOVER/drivers64UEFI/
-- 3. Unmounts your EFI partition
-- It requires no interaction from the user whatsoever (password, disk selection, etc.)
-- You must already be an Admin to run this script
-- Requires High Sierra (10.13.x) or higher
-- Use at your own risk
-- Feel free to improve it but please credit me

on run
	if " admin " is in (do shell script "groups") then
		
		set sysinfo to system info
		set osver to system version of sysinfo
		set source_path to "/usr/standalone/i386/apfs.efi"
		set dest_path to "/Volumes/EFI/EFI/CLOVER/drivers64UEFI/"
		
		considering numeric strings
			set meets_minimum to osver is greater than or equal to "10.13"
		end considering
		
		if meets_minimum then
			set parent_folder to POSIX path of ((path to me as text) & "::")
			
			# mount the disk
			set mount_result to do shell script "/usr/bin/osascript " & parent_folder & "toggle-esp.applescript mount"
			set already_mounted to mount_result contains "already"
			
			# check to see if source file exists
			set source_exists to ((do shell script "test -e " & source_path & " ; echo $?") is "0")
			
			# check to see if destination directory exits
			set destination_exists to ((do shell script "test -d " & dest_path & " ; echo $?") is "0")
			
			# copy file replacing -fp
			if source_exists and destination_exists then
				set scriptResult to "Success"
				do shell script "cp -fp " & source_path & space & dest_path
			else
				set scriptResult to "Script failure"
			end if
			
			# unmount disk if not already mounted prior to the script being run
			if not already_mounted then
				set mount_result to do shell script "/usr/bin/osascript " & parent_folder & "toggle-esp.applescript unmount"
			end if
			
		else
			set scriptResult to "This script requires macos v10.13.x or higher."
			display dialog scriptResult buttons {"OK"}
			
		end if
		
	else
		set scriptResult to "Admin privileges required."
		display dialog scriptResult buttons {"OK"}
	end if
	
	return scriptResult
end run
