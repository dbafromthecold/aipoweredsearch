


$Server = "localhost"
$Database = "burrito-bot-db"

$Query = "SELECT CAST(embeddings AS NVARCHAR(MAX)) AS Embedding
FROM dbo.restaurants
ORDER BY Id"

$Rows = Invoke-SqlCmd -ServerInstance $Server -Database $Database -Query $Query -MaxCharLength 1000000

$CleanedData = @()

foreach($row in $rows){
    $CleanedDataRow = $row.Embedding
    $CleanedData += ($CleanedDataRow.Trim('[', ']')).Replace(",","`t")
}

$CleanedData | Set-Content C:\temp\embeddings.tsv 





$rows = Invoke-Sqlcmd `
    -ServerInstance $Server `
    -Database $Database `
    -Query "
        SELECT [name], [city], [rating], [review_count], [address], [phone]
        FROM dbo.restaurants
        ORDER BY Id
    "

$rows |
ForEach-Object {
    @(
        $_.name,
        $_.city,
        $_.rating,
        $_.review_count,
        $_.address,
        $_.phone
    ) -join "`t"
} |
Set-Content "C:\temp\restaurant_metadata.tsv"
