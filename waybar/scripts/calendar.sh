#!/bin/bash

# Get the current date
current_date=$(date +'%d')

# Generate the calendar for the current month with weeks starting on Monday
calendar=$(cal -m | awk -v current_date="$current_date" '
BEGIN {
    # Define the color for today (current date)
    today_color="\033[1;31m"  # Red color for the current day
    reset_color="\033[0m"  # Reset color
}
{
    # Highlight current day with red color
    for (i = 1; i <= NF; i++) {
        if ($i == current_date) {
            $i = today_color $i reset_color
        }
    }
    print $0
}')

# Output the calendar in the tooltip for the clock
echo "{\"text\": \"$(date +'%A, %d %B | %H:%M')\", \"tooltip\": \"$calendar\"}"
