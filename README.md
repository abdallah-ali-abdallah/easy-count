#### Text Statistics Script 📝📊

This script calculates the number of lines, words, and characters in a given text. It can process content from a file or from the clipboard if no file is specified.

#### Table of Contents 📚
1. [Description](#description)
2. [Usage](#usage)
3. [Dependencies](#dependencies)
4. [Installation](#installation)
5. [Example Usage](#example-usage)

#### Description

The `text_stats.sh` script reads text content from a file or the clipboard and calculates the following statistics:
- Number of lines
- Number of words
- Number of characters

The output is displayed in a colored table format for better readability.

#### Usage

- **Processing File Content:**
  - Create a text file, for example `example.txt`, and fill it with some text.
  - Run the script with the file name as an argument:
    ```sh
    ./text_stats.sh example.txt
    ```
  - The script will display the number of lines, words, and characters in the file.

- **Processing Clipboard Content:**
  - Copy some text to the clipboard.
  - Run the script without any arguments:
    ```sh
    ./text_stats.sh
    ```
  - The script will display the number of lines, words, and characters in the clipboard content.

#### Dependencies 📦

The script requires either `xclip` or `xsel` to read clipboard content. If neither is installed, the script will suggest installing one of them.

#### Installation 🛠️

##### Ubuntu
To install `xclip`:
```sh
sudo apt-get update
sudo apt-get install xclip
```

To install `xsel`:
```sh
sudo apt-get update
sudo apt-get install xsel
```

##### Fedora
To install `xclip`:
```sh
sudo dnf install xclip
```

To install `xsel`:
```sh
sudo dnf install xsel
```

##### Arch Linux
To install `xclip`:
```sh
sudo pacman -S xclip
```

To install `xsel`:
```sh
sudo pacman -S xsel
```

#### Example Usage

1. **Processing File Content:**
   - Create a text file named `example.txt` with some content:
     ```sh
     echo "This is a sample text file." > example.txt
     ```
   - Run the script with the file name:
     ```sh
     ./text_stats.sh example.txt
     ```
   - The output will be:
     ```
     Statistics:
     Number of lines:    1
     Number of words:    6
     Number of characters: 27
     ```

2. **Processing Clipboard Content:**
   - Copy some text to the clipboard (e.g., "This is a sample text from the clipboard").
   - Run the script without any arguments:
     ```sh
     ./text_stats.sh
     ```
   - The output will be:
     ```
     Statistics:
     Number of lines:    1
     Number of words:    8
     Number of characters: 39
     ```


### Notes

- Ensure that `xclip` or `xsel` is installed on your system. You can install them using the commands provided in the "Installation" section.
- The script uses ANSI escape codes to color the output. These codes may not work in all terminal emulators, but they should work in most modern ones.

By following these instructions, you can easily use the `easy-count.sh` script to calculate text statistics from both files and the clipboard.
