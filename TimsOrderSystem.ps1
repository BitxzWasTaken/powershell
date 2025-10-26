# Greet the User
$greeting = Read-Host "Hello! May I take your order?"

$water = 1.50
$smallCoffee = 1
$MediumCoffee = 2
$largeCoffee = 3
$bostonCream = 0.50
$chocolate = 0.50
$plain = 0.50

$date = Get-Date -Format "yyyy-MM-dd h:mmtt"

$orders = @()

function Get-Menu {
  Write-Host "===Menu==="
  Write-Host "Water"
  Write-Host "Small Coffee" 
  Write-Host "Medium Coffee"
  Write-Host "Large Coffee"
  Write-Host "Boston Cream Donut"
  Write-Host "Chocolate Donut"
  Write-Host "Plain Donut"
}


if ($greeting -eq "Yes") {
  Get-Menu
} else {
  Write-Host "Goodbye!"
  exit
}

$numOfItems = Read-Host "How many items would you like to order?"

for ($i = 1; $i -le [int]$numOfItems; $i++) {
  $item = Read-Host "Enter item $i"
  $itemLower = $item.ToLower().Trim()

  switch ($itemLower) {
    "water" {$orders += "Water"}
    "small coffee" {$orders += "Small Coffee"}
    "medium coffee" {$orders += "Medium Coffee"}
    "large coffee" {$orders += "Large Coffee"}
    "boston cream donut" {$orders += "Boston Cream Donut"}
    "chocolate donut" {$orders += "Chocolate Donut"}
    "plain donut" {$orders += "Plain Donut"}
    Default {
      Write-Host "Item not available."
      $i--
    }
  }
}
$total = 0

foreach ($order in $orders) {
  switch ($order) {
    "Water" { $total += $water }
    "Small Coffee" { $total += $smallCoffee }
    "Medium Coffee" { $total += $MediumCoffee }
    "Large Coffee" { $total += $largeCoffee }
    "Boston Cream Donut" { $total += $bostonCream }
    "Chocolate Donut" { $total += $chocolate }
    "Plain Donut" { $total += $plain }
  }
}


$formatTotal = "{0:C}" -f $total

Write-Host ""
Write-Host "===Receipt==="
Write-Host "Date: $date"
Write-Host ""
Write-Host "Ordered:"
foreach ($order in $orders) {
    Write-Host $order
}
Write-Host ""
Write-Host "Total: $formatTotal"