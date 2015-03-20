# cv.sh

This script is quite simple and personal, but is really quite easy to modify for your own needs. It is designed to automate the process of uploading updated résumé PDF files to my webserver and then update the symlink that points to the most recent version.

## The process

1. Which version?

   The script first asks the user for the **version number** of the PDF file to be uploaded and writes it to `$vnum`. Since all of my résumé files follow a naming convention, the version number is the only input required from the user.

2. Uploading through `rsync`

   The script then uploads the PDF to the appropriate location on my webserver using `rsync`.

3. Updating the symlink

   Then, over SSH, I have to execute two commands. Due a webserver limitation, I have to `cd` into the the appropriate directory before I can update the symlink, so the first command executed changes to the correct directory. Immediately after, the script executes `ln -fs` to forcibly update the symlink. If I don't use the `-f` parameter, the command errors out as we are simply updating an existing file, not creating a new one entirely.

## The backend

This script relies on a few preconfigured elements to work properly. First of all, I have to save all of my résumé files in the same local directory and ensure that they follow a naming convention. In my case, I chose `AD-CV_v${vnum}.pdf`.

Second, I authenticate through SSH using public-key authentication, so there's no fiddling with passwords once I have entered the version number I wish to upload. This makes the process slightly quicker.

Because I have all of my old résumés stored on the webserver as well, I've set the permissions of the containing folder to `751`: this means that everybody can execute files within the folder, but there's no chance of a user accidentally stumbling upon the folder and perusing my old résumé files.

The symlink ensures that I can post, embed, and share one link and keep the file pointed to it current.
