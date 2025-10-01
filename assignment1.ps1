# Variable for directories
$mainDir = "~\PowerShell_Assignment1"
$assignments = "$mainDir\Assignment1"
$reports = "$assignments\Reports"
$logs = "$assignments\Logs"

# Creating Assignment1 Directory
New-Item -ItemType Directory -Path $assignments

# Creating Reports Directory
New-Item -ItemType Directory -Path $reports

# Creating Logs Directory
New-Item -ItemType Directory -Path $logs

# Creating Summary.txt
New-Item -ItemType File -Path $reports\Summary.txt

# Creating Quarterly.txt
New-Item -ItemType File -Path $reports\Quarterly.txt

# Creating Annual.xyz
New-Item -ItemType File -Path $reports\Annual.xyz

# Get-ChildItem for reports Directory (.txt files only) and Send the output to report_list.log in logs directory
Get-ChildItem -Path $reports -Filter *.txt | Out-File -FilePath $logs\report_list.log

# List current services and store them in a file called running_services.reports
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object -Property Name, Status | Out-File -FilePath $reports\running_services.report

# Four process that have paged memory values above 50000 and send the output to processes.report in the logs directory
Get-Process | Where-Object {$_.PagedMemorySize -gt 50000} | Sort-Object {$_.PagedMemorySize} -Descending | Select-Object -First 4 -Property Name, PagedMemorySize | Out-File -FilePath $logs\processes.report

# Get-Content to display all files with a .report extension
Get-ChildItem -Path $assignments -Filter *.report | Get-Content

