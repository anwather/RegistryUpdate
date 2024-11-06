[DscResource()]
class RegistryUpdate {
    [DscProperty(Key)]
    [string] $RegKey

    [DscProperty()]
    [string] $ValueName

    [DscProperty()]
    [string] $ValueData

    [RegistryUpdate] Get() {
        $_regKey = Get-Item -Path $this.RegKey
        $value = $_regKey.GetValue($this.ValueName)
        return [RegistryUpdate]@{
            RegKey    = $this.RegKey
            ValueName = $this.ValueName
            ValueData = $value
        }
    }

    [void] Set() {
        New-ItemProperty -Path $this.RegKey -Name $this.ValueName -Value $this.ValueData -Force
    }

    [boolean] Test() {
        $_regKey = Get-Item -Path $this.RegKey
        $value = $_regKey.GetValue($this.ValueName)
        return $value -eq $this.ValueData
    }
}