# Show puppet certificate name: puppet config print certname
# Uninstall puppet agent and reboot 
# remove old puppet files: remove-item C:\ProgramData\PuppetLabs\puppet -Recurse -Confirm:$false
# Purge cert from puppet server: puppet node purge <CERTNAME>
# Reinstall agent with trusted facts
    [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};
    $webClient = New-Object System.Net.WebClient;
    $webClient.DownloadFile('https://puppet:8140/packages/current/install.ps1', 'install.ps1');
    .\install.ps1 custom_attributes:challengePassword='Jackass247!!' extension_requests:pp_role=webserver extension_requests:pp_datacenter=TPL-East extension_requests:pp_environment=development

#9.3.2024
# test update
