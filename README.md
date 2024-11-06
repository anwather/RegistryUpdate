# RegistryUpdate

Custom registry module because machine configuration can only accept a string value via policy. The original registry DSC resource converts into an object which the GC agent doesn't know how to replace.

## Usage

```
# Example to update a registry key

Configuration WindowsUpdate {

    Import-DscResource -ModuleName 'RegistryUpdate'

    RegistryUpdate TargetGroup {
        RegKey    = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate'
        ValueName = 'TargetGroup'
        ValueData = 'ReplacedByPolicy'
    }
}
```

When replacing this parameter in a policy the parameter block would look like below.

```
$policyParameterInfo = @{
    Name                 = 'TargetGroup'
    DisplayName          = 'Target Group'
    Description          = 'Value to be added'
    ResourceType         = 'RegistryUpdate'
    ResourceId           = 'TargetGroup'
    ResourcePropertyName = 'ValueData'
}
```
