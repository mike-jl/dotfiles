#!/bin/bash

start=$(yabai -m query --spaces --display)

yabai -m space --create

end=$(yabai -m query --spaces --display)

new_index=$(jq -n --argjson start "$start" --argjson end "$end" '$end - $start | .[0].index')

yabai -m space --focus $new_index

