#!/bin/bash

## Input domain
DOMAIN=$1

## Output file
OUTPUT_FILE="unique_domains.txt"

## Make sure a domain is provided
if [ -z "$DOMAIN"  ]; then
    echo "Usage: $0 <domain>"
        exit 1
        fi

# Fetch certificates related to the domain using crt.sh's API
        curl -s "https://crt.sh/?q=%25.$DOMAIN&output=json" |  jq -r '.[].name_value' | sed 's/\*\.//g' | sort | uniq > "$DOMAIN.$OUTPUT_FILE"

#         Inform the user
        echo "Unique domains saved to $DOMAIN.$OUTPUT_FILE"

