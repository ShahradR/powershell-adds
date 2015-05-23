﻿$disks = Get-Disk | Where-Object {$_.NumberOfPartitions -eq 0}
    
If (@($disks).Count > 0)
{
    foreach ($disk in $disks)
    {
        $disk |`
        New-Partition -AssignDriveLetter -UseMaximumSize | `
        Format-Volume -FileSystem NTFS -Force
    }
}