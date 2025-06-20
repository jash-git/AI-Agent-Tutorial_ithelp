#!/bin/bash

mkdir part01

# Set input video file name
input_file="videoplayback.mp4"

# Set segment duration in seconds
segment_duration=80

# Set output file name pattern
output_file_pattern="./part01/part%04d.mp4"

# Calculate total number of segments
total_segments=1193/80

# Split the video into segments
for i in $(seq 0 $((total_segments - 1))); do
start_time=$((i * segment_duration))
output_file=$(printf "$output_file_pattern" $i)
./ffmpeg.exe -i "$input_file" -ss $start_time -t $segment_duration -vcodec copy -acodec copy "$output_file"
done