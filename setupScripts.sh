#!/usr/bin/bash

echo "Path for script dir:"
read dirPath
echo "Path for bashrc"
read bashrc

if [ -d "$dirPath" ]; then
    mkdir "$dirPath"/scripts
    
    #mksite
    touch "$dirPath"/scripts/mksite.sh
    cat << EOF > "$dirPath"/scripts/mksite.sh
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
    echo "Usage: mksite [NAME]"
fi
EOF
    # end

    # Giving permissions to script
    chmod +x "$dirPath"/scripts/mksite.sh

    # Converting scripts to commands
    echo "alias mksite='"$dirPath"/scripts/mksite.sh'" >> "$bashrc"

    source "$bashrc"

else
    echo "Path doesn't exist"
fi