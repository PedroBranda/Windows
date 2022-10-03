# Windows
Repository to archive my ps1 scripts.

To enable Windows 11 - advanced power options:

“Using Registry Editor, go to HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Contro l\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7 and select Attributes. Modify the value of "Attributes" from 1 to 2. Data should read “0x00000002 (2)”. This will uncover a hidden power option.

To enable Powershell script execution:

Set-ExecutionPolicy Unrestricted
