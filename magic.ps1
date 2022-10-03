function VerifyChoco {
    Echo "Checking Chocolatey installation..."
    Test-Path -Path "$env:ProgramData\Chocolatey" 
}

function InstallChoco {
    Echo "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function InstallPackages {
    Echo "Initializing the packages installation..."
    $Packages = "androidstudio", "brave", "discord", "git", "krita", "nvm", "phpstorm", "postman", "python", "scrcpy", "sublimetext4", "termius", "tixati", "vscode", "webstorm"
    ForEach ($PackageName in $Packages) {
        Echo "Installing package: $PackageName"
        Try { 
            choco install $PackageName -y 
        } Catch {
            Echo "An error occurred."
        }
    }
    refreshenv
    Pause
}

$Choco = VerifyChoco

If ($Choco) {
    Echo "Chocolatey already installed!"
    InstallPackages
} Else {
    Echo "Chocolatey is not installed!"
    InstallChoco
    InstallPackages
}
