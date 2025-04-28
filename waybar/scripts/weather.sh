#!/bin/bash

# Fetch weather
current=$(curl -s "wttr.in/?format=%c+%t" | tr -d '\n')

# Fetch short 3-day forecast (no special formatting)
forecast=$(curl -s "wttr.in/?format=Today:+%C+%t\\nTomorrow:+%C+%t\\nDay+After:+%C+%t" | sed ':a;N;$!ba;s/\n/\\n/g')

# Output JSON safely
echo "{\"text\": \"$current\", \"tooltip\": \"$forecast\"}"
