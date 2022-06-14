
### Download repository ###
if [ ! -d "./KrisLindahlCom" ]
then
    echo "Directory KrisLindahlCom DOES NOT exists. Pulling Repository from github.."
    git clone git@github.com:zbwest/KrisLindahlCom.git
    cd KrisLindahlCom
    git checkout master
    cd ..
else
    echo "Directory KrisLindahlCom exists. Skipping pull repository pull.."
fi

### Unpack init db scripts ###
if [ ! -d "./init_db/init.sql" ]
then
    echo "Setting up initial database scripts for WP ...."
    mkdir tmp
    mkdir init_db
    find init -name 'init-db*.*' -exec cp {} tmp/ \;
    #cp init/init-db-script.tar.gz.* tmp/.
    cd tmp
    cat init-db-script.tar.gz.* | tar xzvf - --directory ../init_db/
    cd ..
else
    echo "Init SQL already downloads. Skilling init db script run..."
fi


### Download wordpress contents ###

if [ ! -d "./wordpress" ]
then
    echo "Setting up contents for wp ...."
    mkdir wordpress
    mkdir wordpress/wp-content
    ## Change this line to download from net
    find init -name 'uploads.*' -exec cp {} tmp/ \;
    find init -name 'themes.*' -exec cp {} tmp/ \;
    find init -name 'plugins.*' -exec cp {} tmp/ \;
    #cp init/uploads.tar.gz.* tmp/.
    #cp init/themes.tar.gz.* tmp/.
    #cp init/plugins.tar.gz.* tmp/.

    cd tmp
    cat uploads.tar.gz.* | tar xzvf - --directory ../wordpress/wp-content/
    cat themes.tar.gz.* | tar xzvf - --directory ../wordpress/wp-content/
    cat plugins.tar.gz.* | tar xzvf - --directory ../wordpress/wp-content/

    cd ..
    rm -rf wordpress/wp-content/plugins/klrewprocketdelayjsexclusions
    rm -rf wordpress/wp-content/plugins/valtiranotifications
    rm -rf wordpress/wp-content/plugins/valtiraidx
    rm -rf wordpress/wp-content/plugins/valtiraspot
    rm -rf wordpress/wp-content/themes/valtira
else
    echo "WP content already exists..."
fi

## remove tmp file ##
rm -rf tmp

echo "Local content setup complete.."

exit 9999 # die with error code 9999
