curl "https://aws.amazon.com/api/dirs/items/search?item.directoryId=aws-products&size=300&item.locale=en_US" | jq '.items[].item.additionalFields| .productCategory,.productName,.productSummary' | paste - - - | column

curl "https://aws.amazon.com/api/dirs/items/search?item.directoryId=aws-products&size=300&item.locale=en_US" | jq '.items[].item.additionalFields| .productCategory,.productName,.productSummary' | paste -d, - - - | grep -v "\(Preview\)" | sort > /mnt/c/Users/antha/Downloads/aws-services_new.csv
