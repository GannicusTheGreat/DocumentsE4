import-module activedirectory


$inactif =  ((get-date).adddays(-45)).ToFileTime()

$userinactif = Get-ADUser -filter {enabled -eq $false -and (LastLogonTimestamp -lt $inactif)} -SearchBase "DC=Assurmer,OU=Assurmer.fr"

ForEach ($user in $userinactif) {
    Remove-ADObject -Identity $user.DistinguishedName -Confirm:$false
}

