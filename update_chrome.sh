#!/bin/bash

FILE="/Users/will/Library/Application Support/Google/Chrome/Local State"

echo "Closing Chrome..."
pkill -f "Google Chrome" 2>/dev/null
sleep 2

echo "Backing up..."
cp "$FILE" ~/Desktop/Local_State_$(date +%Y%m%d_%H%M).backup

echo "Modifying..."

# 1. Gemini eligibility
sed -i '' 's/"is_glic_eligible":[[:space:]]*false/"is_glic_eligible":true/g' "$FILE"

# 2. Permanent consistency country
sed -i '' 's/"variations_permanent_consistency_country":\[\([^,]*\),"[^"]*"\]/"variations_permanent_consistency_country":[\1,"us"]/g' "$FILE"

# 3. Current Variations country
sed -i '' 's/"variations_country":"[^"]*"/"variations_country":"us"/g' "$FILE"

echo "-----------------------------------"
echo "Verifying modifications:"
grep -o '"is_glic_eligible":[^,}]*' "$FILE" | head -n 1
grep -o '"variations_permanent_consistency_country":\[[^]]*\]' "$FILE" | head -n 1
grep -o '"variations_country":"[^"]*"' "$FILE" | head -n 1
echo "-----------------------------------"

echo "Done! Restart Chrome and check chrome://flags"
