#!/bin/zsh

# Function to parse human-readable time
parse_time() {
    case "$1" in
        *s) echo "${1%s}";;  # seconds (e.g., 10s → 10)
        *m) echo "$(( ${1%m} * 60 ))";;  # minutes (e.g., 5m → 300)
        *h) echo "$(( ${1%h} * 3600 ))";;  # hours (e.g., 2h → 7200)
        *d) echo "$(( ${1%d} * 86400 ))";;  # days (e.g., 1d → 86400)
        *) echo "$1" ;;  # Assume raw seconds if no suffix
    esac
}

remind() {
    local time message seconds

    # Parse arguments
    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -t)
                shift
                seconds=$(parse_time "$1")
                ;;
            *)
                message="$1"
                ;;
        esac
        shift
    done

    # Ensure valid time
    if [[ -z "$seconds" || -z "$message" ]]; then
        echo "Usage: remind -t <time> <message>"
        return 1
    fi

    # Schedule the reminder
    (sleep "$seconds" && osascript -e "display notification \"$message\" with title \"Reminder\"" && afplay /System/Library/Sounds/Glass.aiff) &
}

remind "$@"
