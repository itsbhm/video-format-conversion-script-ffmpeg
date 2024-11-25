#!/bin/bash

# Get the full absolute path of the current directory
current_dir=$(pwd)

# Full absolute path to ffmpeg binary (change it if your ffmpeg is in a different location)
ffmpeg_path="$current_dir/bin/ffmpeg"  # Assumes ffmpeg binary is in the 'bin' directory

# Check if FFmpeg exists at the specified path
if [[ ! -f "$ffmpeg_path" ]]; then
    echo "FFmpeg not found at $ffmpeg_path. Please make sure the binary is in the 'bin' directory or update the path."
    exit 1
fi

# Input file (use full path for the input file)
input_file="$current_dir/input.mp4"  # Replace with the full path to your .mp4 file

# Check if the input file exists
if [[ ! -f "$input_file" ]]; then
    echo "Input file '$input_file' not found. Please place the video file in the current directory."
    exit 1
fi

# Output directory (you can change this to any desired location)
output_dir="$current_dir/output"  # Will use a folder in the current directory

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# List of available formats and their corresponding ffmpeg commands
echo "Choose a conversion format:"
echo "1) Audio Video Interleave File (.avi)"
echo "2) 3GP Video File (.3gp)"
echo "3) Flash Video File (.flv)"
echo "4) MPEG Video File (.mpeg)"
echo "5) Video Object File (.vob)"
echo "6) Windows Media Video File (.wmv)"
echo "7) QuickTime Movie File (.mov)"
echo "8) Matroska Video File (.mkv)"
echo "9) Advanced Systems Format File (.asf)"
echo "10) Apple iPod/iTunes Video File (.m4v)"
echo "11) Flash H.264 Video File (.f4v)"
echo "12) 3G2 Video File (.3g2)"
echo "13) Raw H.264 Video File (.264)"
echo "14) H.265/HEVC Video File (.mp4)"
echo "15) H.265/HEVC Apple Movie File (.mov)"
echo "16) Anime Music Video File (.amv)"
echo "17) Extracted audio only (.mp3)"
echo "18) Extracted audio only (.wav)"
echo "19) Extracted thumbnails (.jpg)"
echo "20) Animated GIF File (.gif)"

# Prompt user to select a format
read -p "Enter the number of your desired format (1-20): " format_choice

# Perform the conversion based on user input
case $format_choice in
    1)
        $ffmpeg_path -i "$input_file" -c:v libxvid -c:a mp3 "$output_dir/output.avi"
        echo "Conversion to AVI complete! File saved at: $output_dir/output.avi"
        ;;
    2)
        $ffmpeg_path -i "$input_file" -c:v libx264 -c:a aac "$output_dir/output.3gp"
        echo "Conversion to 3GP complete! File saved at: $output_dir/output.3gp"
        ;;
    3)
        $ffmpeg_path -i "$input_file" -c:v flv -c:a mp3 "$output_dir/output.flv"
        echo "Conversion to FLV complete! File saved at: $output_dir/output.flv"
        ;;
    4)
        $ffmpeg_path -i "$input_file" -c:v mpeg2video -c:a mp2 "$output_dir/output.mpeg"
        echo "Conversion to MPEG complete! File saved at: $output_dir/output.mpeg"
        ;;
    5)
        $ffmpeg_path -i "$input_file" -c:v mpeg2video -c:a ac3 "$output_dir/output.vob"
        echo "Conversion to VOB complete! File saved at: $output_dir/output.vob"
        ;;
    6)
        $ffmpeg_path -i "$input_file" -c:v wmv2 -c:a wmav2 "$output_dir/output.wmv"
        echo "Conversion to WMV complete! File saved at: $output_dir/output.wmv"
        ;;
    7)
        $ffmpeg_path -i "$input_file" -c:v qtrle -c:a pcm_s16be "$output_dir/output.mov"
        echo "Conversion to MOV complete! File saved at: $output_dir/output.mov"
        ;;
    8)
        $ffmpeg_path -i "$input_file" -c:v libx264 -c:a aac "$output_dir/output.mkv"
        echo "Conversion to MKV complete! File saved at: $output_dir/output.mkv"
        ;;
    9)
        $ffmpeg_path -i "$input_file" -c:v wmv2 -c:a wmav2 "$output_dir/output.asf"
        echo "Conversion to ASF complete! File saved at: $output_dir/output.asf"
        ;;
    10)
        $ffmpeg_path -i "$input_file" -c:v libx264 -c:a aac "$output_dir/output.m4v"
        echo "Conversion to M4V complete! File saved at: $output_dir/output.m4v"
        ;;
    11)
        $ffmpeg_path -i "$input_file" -c:v libx264 -c:a aac "$output_dir/output.f4v"
        echo "Conversion to F4V complete! File saved at: $output_dir/output.f4v"
        ;;
    12)
        $ffmpeg_path -i "$input_file" -c:v libx264 -c:a aac "$output_dir/output.3g2"
        echo "Conversion to 3G2 complete! File saved at: $output_dir/output.3g2"
        ;;
    13)
        $ffmpeg_path -i "$input_file" -c:v libx264 -an -f rawvideo "$output_dir/output.264"
        echo "Conversion to Raw H.264 complete! File saved at: $output_dir/output.264"
        ;;
    14)
        $ffmpeg_path -i "$input_file" -c:v libx265 -c:a aac "$output_dir/output_265.mp4"
        echo "Conversion to H.265/HEVC MP4 complete! File saved at: $output_dir/output_265.mp4"
        ;;
    15)
        $ffmpeg_path -i "$input_file" -c:v libx265 -c:a aac "$output_dir/output_265.mov"
        echo "Conversion to H.265/HEVC MOV complete! File saved at: $output_dir/output_265.mov"
        ;;
    16)
        $ffmpeg_path -i "$input_file" -c:v libxvid -c:a libmp3lame "$output_dir/output.amv"
        echo "Conversion to AMV complete! File saved at: $output_dir/output.amv"
        ;;
    17)
        $ffmpeg_path -i "$input_file" -vn -c:a libmp3lame "$output_dir/output.mp3"
        echo "Audio extraction (MP3) complete! File saved at: $output_dir/output.mp3"
        ;;
    18)
        $ffmpeg_path -i "$input_file" -vn -c:a pcm_s16le "$output_dir/output.wav"
        echo "Audio extraction (WAV) complete! File saved at: $output_dir/output.wav"
        ;;
    19)
        $ffmpeg_path -i "$input_file" -vf "thumbnail,scale=640:360" -frames:v 1 "$output_dir/output_thumbnail.jpg"
        echo "Thumbnail extraction complete! File saved at: $output_dir/output_thumbnail.jpg"
        ;;
    20)
        $ffmpeg_path -i "$input_file" -vf "fps=10,scale=320:-1:flags=lanczos" "$output_dir/output.gif"
        echo "GIF creation complete! File saved at: $output_dir/output.gif"
        ;;
    *)
        echo "Invalid option. Please choose a number between 1 and 20."
        exit 1  # Exit gracefully if the user inputs an invalid choice
        ;;
esac
