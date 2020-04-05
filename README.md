website
=======

My personal Web Site http://www.berczuk.com


# Updating
From the project directory run
` rsync -av --exclude='.*/' .  sberczuk2014@www.berczuk.com:~/public_html`

use the `-n` option to preview which files will be updated.

# Dev

* run the node http_server:
  * cd web-dir && http_server
  * edit


* To update events dir:
  * edit events/events.json
  * run the pagegen tool (in another repo)
