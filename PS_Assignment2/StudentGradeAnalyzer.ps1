# Name: Jonathan Strickland
# Student Number: 20165947

# User input to determine how many grades will be entered
[int]$numOfGrades = Read-Host "How many grades would you like to enter?"

# Error if the number is not a valid positive number
while (-not ($numOfGrades -as [int]) -or ([int]$numOfGrades -le 0)) {
  Write-Host "Must be a postive number." -ForegroundColor Red
  $numOfGrades = Read-Host "How many grades would you like to enter?"
}

# Makes grades an array
$grades = @()

# Starting $i at 1, $i++ adds 1 and i$ -le $numOfGrades means $i will count till it reaches the number the user inputs
for ($i = 1; $i -le $numOfGrades; $i++) {
  do {
    # User inputs the grades they recieved
    $grade = Read-Host "Enter grade $i (0-100)"
    # Throws an error if the user inputs a word, a number less than 0 and a number greater than 100
    if ($grade -as [int] -and [int]$grade -ge 0 -and [int]$grade -le 100) {
      $valid = $true
    } else {
      Write-Host "Invalid grade. Please enter a number between 0 and 100" -ForegroundColor Red
      $valid = $false
    }
  } while (-not $valid)
  # Appearently I didn't need {} for the while loop because if there is this displays as if it was a Write-Host
  # But this is adding the current grade to the grades array
    $grades += $grade
}

# Checks each grade to see if it is passing or failing
$passing = ($grades | Where-Object {[int]$_ -ge 50}).Count
$failing = ($grades | Where-Object {[int]$_ -lt 50}).Count

# Checks each grade to see which is highest and lowest
$highest = ($grades | Measure-Object -Maximum).Maximum
$lowest = ($grades | Measure-Object -Minimum).Minimum

# Displays the passing, failing, highest and lowest grade
Write-Host ""
Write-Host "Results:" -ForegroundColor Cyan
Write-Host "Passing grades: $passing" -ForegroundColor Green
Write-Host "Failing grades: $failing" -ForegroundColor Red
Write-Host "Highest grade: $highest" -ForegroundColor Yellow
Write-Host "Lowest grade: $lowest" -ForegroundColor DarkGray