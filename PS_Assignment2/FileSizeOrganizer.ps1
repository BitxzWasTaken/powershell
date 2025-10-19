# Name: Jonathan Strickland
# Stundent Number: 20165947

do {
    # Menu
    '
    1) Step 1: Enter Directory
    2) Step 2: Check each file size
    3) Exit
    '

    # User Prompt to select a option from the menu
    $choices = Read-Host "Choose an option"

    switch ($choices) {
        1 {
            # User Prompt to enter their directory they want to organize
            $dir = Read-Host "Enter your directory you want to organize!"
            
            # Checks if the path exists if not its exits the script
            if (Test-Path -Path $dir) {
                Write-Host "$dir exisits" -ForegroundColor Green
            } else {
                Write-Host "$dir don't exist... Goodbye!" -ForegroundColor Red
                Exit
            }
        }

        2 {
            # Uses Get-ChildItem, Sort-Object and Select-Object to get each file out of the directory the user inputed
            $files = Get-ChildItem -Path $dir -File # | Sort-Object {$_.length} | Select-Object -Property Name, length
            
            # Checks if the user inputed a directory, if not returns to menu
            if ($null -eq $dir) {
                Write-Host "Please enter a directory" -ForegroundColor Red
                break
            } else {
                Write-Host "Sorting Files in $dir" -ForegroundColor Green
                Write-Host ""
                # Starts counter at 0 for each file size
                $fileSmall = 0
                $fileMed = 0
                $fileLarge = 0
                
                # Checks each file in the directory to see if its a small, medium or large file
                foreach ($file in $files) {
                    $fileName = $file.Name
                    $fileSize = $file.length / 1KB

                    # We haven't covered this in class but what this does is rounds the filesize to the nearest decimal (1.23) instead of having trailing decimals (1.2345678)
                    $sizeFormat = "{0:N2}" -f $fileSize

                    if ($fileSize -lt 1) {
                        Write-Host "File: $fileName | File Size: $sizeFormat KB | Category: Small"
                        $fileSmall = $fileSmall + 1
                    } elseif ($fileSize -gt 1 -and $fileSize -lt 100) {
                        Write-Host "File: $fileName | File Size: $sizeFormat KB | Category: Medium"
                        $fileMed = $fileMed + 1
                    } elseif ($fileSize -gt 100) {
                        Write-Host "File: $fileName | File Size: $sizeFormat KB | Category: Large"
                        $fileLarge = $fileLarge + 1
                    }
                }
                Write-Host ""
                Write-Host "Small: $fileSmall"
                Write-Host "Medium: $fileMed"
                Write-Host "Large: $fileLarge"
            }
        }

        3{
            # Exits script
            Write-Host "See ya later alligator!"
            exit
        }

        default {
            # Displays if a number over 3 is entered, works with while to close the script
            Write-Host "ERROR: Invalid selection made" -ForegroundColor Red
        }
    }
} while ($choice -ne 4) {
    Write-Host "Goodbye!"
}