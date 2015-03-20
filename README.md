# cv.sh

This script is quite simple and quite personal, but is really quite easy to modify for your own needs. It is designed to automate the process of uploading updated résumé PDF files to my webserver and then update the symlink that points to the most recent version.

## The process

1. Which version?

   The script first asks the user for the **version number** of the PDF file to be uploaded and writes it to `$vnum`. Since all of my résumé files follow a naming convention, the version number is the only input required from the user.

2. Uploading through `rsync`

   The script then uploads the PDF to the appropriate location on my webserver using `rsync`.

3. Updating the symlink

   Then, over SSH, I have to execute two commands. Due a webserver limitation, I have to `cd` into the the appropriate directory before I can update the symlink, so the first command executed changes to the correct directory. Immediately after, the script executes `ln -fs` to forcibly update the symlink. If I don't use the `-f` parameter, the command errors out as we are simply updating an existing file, not creating a new one entirely.

## Other notes

This is not a very complex script. It's just meant to make my own life a little more automated.
