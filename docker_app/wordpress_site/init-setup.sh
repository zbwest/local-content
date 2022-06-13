
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
    cp init/init-db-script.tar.gz tmp/.
    cd tmp
    tar -xvf init-db-script.tar.gz --directory ../init_db/
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
    cp init/uploads.tar.gz tmp/.
    cp init/themes.tar.gz tmp/.
    cp init/plugins.tar.gz tmp/.

    cd tmp
    tar -zxf  uploads.tar.gz --directory ../wordpress/wp-content/
    tar -zxf  themes.tar.gz --directory ../wordpress/wp-content/
    tar -zxf  plugins.tar.gz --directory ../wordpress/wp-content/

    cd ..
    rm -rf wordpress/wp-content/plugins/klrewprocketdelayjsexclusions
    rm -rf wordpress/wp-content/plugins/valtiranotifications
    rm -rf wordpress/wp-content/plugins/valtiraidx
    rm -rf wordpress/wp-content/plugins/valtiraspot
    rm -rf wordpress/wp-content/themes/valtira
f

else
    echo "WP content already exists..."
fi

## remove tmp file ##
rm -rf tmp

echo "Local content setup complete.."

exit 9999 # die with error code 9999
