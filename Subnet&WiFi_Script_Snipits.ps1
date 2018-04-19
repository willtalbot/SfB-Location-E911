#   Add Subnet to Location Database
#   For ELIN gateways, put the ELIN in the CompanyName field. You can include more than one ELIN
#Import Subnet information
$import_Subnet = $(read-host -Prompt "Please enterlocation of Subnet CSV file")
$SubNet_Info = Import-Csv $import_Subnet
foreach ($SubNet_Info in $SubNet_Info)
{
Set-CsLisSubnet -Subnet $SubNet_Info.subnet -Description $SubNet_Info.location -Location $SubNet_Info.location -CompanyName $SubNet_Info.ELIN -HouseNumber $SubNet_Info.House_Number -HouseNumberSuffix "" -PreDirectional "" -StreetName $SubNet_Info.Street_Name -StreetSuffix $SubNet_Info.Street_Suffix -PostDirectional $SubNet_info.Post_Directional -City $SubNet_Info.City -State $SubNet_Info.State -PostalCode $SubNet_Info.ZIP_Code -Country $SubNet_Info.Country
}


#  Add Wireless Access Point 

$import_WiFi = $(read-host -Prompt "Please enterlocation of WiFi CSV file")
$WiFi_Info = Import-Csv $import_WiFi
foreach ($WiFi_info in $WiFi_Info)
{
Set-CsLisWirelessAccessPoint -BSSID $WiFi_Info.BSSID -Description $WiFi_Info.AP_Name -Location $WiFi_Info.location -CompanyName $WiFi_Info.ELIN -HouseNumber $WiFi_Info.House_Number -HouseNumberSuffix "" -PreDirectional "" -StreetName $WiFi_Info.Street_Name -StreetSuffix $WiFi_Info.Street_Suffix -PostDirectional $WiFi_Info.Post_Directional -City $WiFi_Info.City -State $WiFi_Info.State -PostalCode $WiFi_Info.ZIP_Code -Country $WiFi_Info.Country 
}

#     Publish LIS Configuration once complete
Publish-CsLisConfiguration