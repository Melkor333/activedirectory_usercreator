# import the xmlfile with the user names

function createpw {
    $global:pw = -join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
    $pw
}

$file = "C:\Temp\users.xml"

function import ($file){
    $numbers = 1..250

    [xml]$xml = Get-Content $file
    $xml.users.user
        foreach ($number in $numbers){

            createpw
            $new_user = $xml.CreateElement("user")

            $xml.users.AppendChild($new_user)

            $new_user.SetAttribute("name", "user$($number)")
            $new_user.SetAttribute("Pw", $global:pw)
        }
    $xml.Save("C:\Temp\users.xml")
}
    



# create a log file with this pattern -> NOT as xml. its like this:
# ERROR: Something went wrong
# INFO: Something happened
# ...
function logging ($list, $file) {

    # $log = logmesagge

    $logfile = "C:\Temp\log.log"
    
    Add-Content -Value $log -Path $logfile 
}

# export the list of all created users together with their password as xml file
function export ($list, $file) {
   # wird garnüm brucht oder?  
  
}
