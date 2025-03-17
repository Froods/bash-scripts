#!/usr/bin/bash

echo "Path for script dir:"
read dirPath
echo "Path for bashrc"
read bashrc

if [ -d "$dirPath" ]; then
    mkdir "$dirPath"/scripts
    
    #mkSite
    touch "$dirPath"/scripts/mkSite.sh
    cat << EOF > "$dirPath"/scripts/mkSite.sh
#!/usr/bin/bash

if [ -n "\$1" ]; then
    mkdir "\$1"
    mkdir "\$1"/styles
    mkdir "\$1"/js
    touch "\$1"/index.html "\$1"/styles/main.css "\$1"/js/js.js
    echo "<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta charset=\"UTF-8\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <title>Document</title>

        <link rel=\"stylesheet\" type=\"text/css\" href=\"styles/main.css\">
        <script type=\"text/javascript\" src=\"js/js.js\" defer></script>
    </head>
    <body>
    
    </body>
</html>" > "\$1"/index.html

    cd "\$1"
    code .
else
    echo "Usage: mkSite [NAME]"
fi
EOF
    # end

    # Giving permissions to script
    chmod +x "$dirPath"/scripts/mkSite.sh

    # Converting scripts to commands
    echo "alias mkSite='"$dirPath"/scripts/mkSite.sh'" >> "$bashrc"

    source "$bashrc"

else
    echo "Path doesn't exist"
fi