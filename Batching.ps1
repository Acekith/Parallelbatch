[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [Array]$InputArray,

    [Parameter(Mandatory=$false)]
    [int]$BatchSize = 250
)

#Setup BatchQueue size and queue
$BatchQueue = [System.Collections.Generic.Queue[pscustomobject]]::new($BatchSize)

#build batches and execute 
$InputArray | ForEach-Object {
    $BatchQueue.Enqueue($_)
    if ($BatchQueue.Count -eq $BatchSize) {
        <#
        scriptblock of what you need done on the batch goes here. $batchQueue holds Objects to process 
        #>
        $BatchQueue.Clear()
    }
}

# Process any remaining items.
if ($batch.Count) { #scriptblock geos here. 
    
    <#
    scriptblock of what you need done on the batch goes here. $batchQueue holds Objects to process 
    #>
  }