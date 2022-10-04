function InstallChoco {
    Echo "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function InstallPackages {
    Echo "Initializing the packages installation..."
    # Array with package names to install, to view the packages access: https://community.chocolatey.org/packages
    $Packages = @(
        "androidstudio",
        "brave",
        "composer",
        "discord",
        "git",
        "krita",
        "laragon",
        "nvm",
        "openjdk11",
        "phpstorm",
        "postman",
        "python",
        "scrcpy",
        "sublimetext4",
        "termius",
        "tixati",
        "vscode",
        "webstorm"
    )
    ForEach ($Name in $Packages) {
        Echo "Installing package: $Name"
        Try { 
            choco install $Name -y 
        } Catch {
            Echo "An error occurred."
        }
    }
    refreshenv
    Pause
}

If (Test-Path -Path "$env:ProgramData\Chocolatey") {
    Echo "Chocolatey already installed!"
    InstallPackages
} Else {
    Echo "Chocolatey is not installed!"
    InstallChoco
    InstallPackages
}
