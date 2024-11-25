# Video Format Conversion Script

This is a Bash script that allows you to convert an MP4 video file to various output formats using FFmpeg. It provides an interactive interface where the user can choose from a list of conversion formats. The script also handles errors, ensuring the user is informed about missing files or incorrect input.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Supported Formats](#supported-formats)
- [Error Handling](#error-handling)
- [License](#license)

## Requirements

- macOS (although it may work on other UNIX-like systems, it's optimized for macOS).
- FFmpeg binary must be available (included in the `bin/` directory or installed globally).
- A terminal or command-line interface.

## Installation

1. **Clone the Repository**:
   Clone this repository to your local machine.

   ```bash
   git clone https://github.com/yourusername/video-format-conversion.git
   cd video-format-conversion
   ```

2. **Place Your Video File**:
   Ensure the `input.mp4` file is in the root of the repository (the same directory as the script).

3. **Ensure FFmpeg is Available**:
   The script expects FFmpeg to be located in the `bin/` directory of the repository. If it's not there, either move your FFmpeg binary into this folder or modify the `ffmpeg_path` in the `script.sh` to point to your FFmpeg binary.

## Usage

1. **Run the Script**:
   Make the script executable and run it.

   ```bash
   chmod +x script.sh
   ./script.sh
   ```

2. **Choose a Conversion Format**:
   After running the script, you will be prompted to choose a conversion format by entering a number (1-20). For example:

   ```
   Choose a conversion format:
   1) Audio Video Interleave File (.avi)
   2) 3GP Video File (.3gp)
   ...
   Enter the number of your desired format (1-20):
   ```

   Once you select a format, the script will convert the input video (`input.mp4`) to your chosen format and save it in the `output/` directory.

## Supported Formats

The script supports the following formats:

1. **Audio Video Interleave File (.avi)**
2. **3GP Video File (.3gp)**
3. **Flash Video File (.flv)**
4. **MPEG Video File (.mpeg)**
5. **Video Object File (.vob)**
6. **Windows Media Video File (.wmv)**
7. **QuickTime Movie File (.mov)**
8. **Matroska Video File (.mkv)**
9. **Advanced Systems Format File (.asf)**
10. **Apple iPod/iTunes Video File (.m4v)**
11. **Flash H.264 Video File (.f4v)**
12. **3G2 Video File (.3g2)**
13. **Raw H.264 Video File (.264)**
14. **H.265/HEVC Video File (.mp4)**
15. **H.265/HEVC Apple Movie File (.mov)**
16. **Anime Music Video File (.amv)**
17. **Extracted audio only (.mp3)**
18. **Extracted audio only (.wav)**
19. **Extracted thumbnails (.jpg)**
20. **Animated GIF File (.gif)**

## Error Handling

- **Missing FFmpeg**: The script checks if FFmpeg is available at the specified path (`bin/ffmpeg`). If FFmpeg is not found, it will prompt you with an error and exit.

- **Missing Input File**: The script checks if `input.mp4` is available in the current directory. If the file is missing, the script will notify you and exit.

- **Invalid Format Choice**: If the user selects an invalid option (a number outside 1-20), the script will display an error message and exit gracefully.

## Example

```bash
$ ./script.sh
Choose a conversion format:
1) Audio Video Interleave File (.avi)
2) 3GP Video File (.3gp)
3) Flash Video File (.flv)
...
Enter the number of your desired format (1-20): 1
Conversion to AVI complete! File saved at: ./output/output.avi
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Notes:
- The script assumes you have a `bin/` folder in the same directory as the script where the FFmpeg binary is located. If your FFmpeg binary is in another location, you need to adjust the `ffmpeg_path` in the script accordingly.
- The output files will be saved in an `output/` directory, which will be created automatically if it doesn't already exist.