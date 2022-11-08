# Redshift-inc

A simple bash script that lets you change redshift's temperature value by increments.

## Installation 
To install, first paste this line in your terminal 
```
mkdir .local/share/redshift-inc && cd ~/.local/share/redshift-inc && git clone https://github.com/InioX/redshift-inc
 ```
Then the script will automatically create a file inside the directory by running
```
redshift-inc -s
```

## Uninstallation
```
rm -rf ~/.local/share/redshift-inc/
```

## Usage
```
./redshift-inc -v <int> -o <+/->
./redshift-inc -v 200 -o +
./redshift-inc -v 200 -o -
```
An example of using this script with sxhkd
```
shift + XF86MonBrightnessUp
    ~/.local/share/redshift-inc.sh -v 200 -o +
shift + XF86monBrightnessDown
    ~/.local/share/redshift-inc.sh -v 200 -o -
```

## Configuration
```
#Path to the file. (Do not add backlash to the last directory)
folder_path=~/.local/share/redshift-inc

# Name of the file (with extension).
file_name=test.txt

# If no value is specified, use default.
default_increment_value=200

# The value that gets written when running setup.
created_value=1700
```
