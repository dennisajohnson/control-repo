class modules::install_chocolatey {
  exec { 'Install Chocolatey':
    command => "powershell.exe -Command \"Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))\"",
    provider => powershell,
  }
}
