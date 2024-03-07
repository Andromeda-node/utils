#!/bin/bash

# List of URLs to check
urls=(
    "https://files.andromedanode.co/${name}/snap_${name}.tar.lz4"
    "https://${type}-files.itrocket.net/${name}/snap_${name}.tar.lz4"
    # Add more URLs here if needed
)

# Iterate over each URL
for url in "${urls[@]}"; do
    if curl -s --head "$url" | head -n 1 | grep "200" > /dev/null; then
        # If the URL returns status 200, download and extract the archive
        curl "$url" | lz4 -dc - | tar -xf - -C "$HOME/${path}"
        # Exit loop since download was successful
        break
    fi
done
