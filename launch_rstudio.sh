## dummy script for lunching rstudio with an specific R version (it also check for existence of the required R version and install it if were required)
# Note 1. It only work on unbuntu 20.04 
# Note 2. It looks for R installations on /opt/R/ path. 


## working examples ### 

## Option 1: passing a specific R version number
#./lunch_rstudio.sh 3.6.3 


## Option 2: passing an renv.lock file (we will read the corresponding version from it)
#./lunch_rstudio.sh 3.6.3 

#requered
# sudo apt-get install curl 
INPUT=$1

if [ -f "${INPUT}" ]; then
        R_VERSION=$(grep 'Version' $INPUT |head -n1|egrep -o '[0-9].*[0-9]');
    else
        echo "${INPUT} is not a file ";
        R_VERSION=$INPUT
    fi

echo "$R_VERSION"

# try
/opt/R/${R_VERSION}/bin/R --version 2>/dev/null

if (( $? == 0 )); then
	echo 'R version is allready installed: lunching rstudio'
else
    sudo apt-get update
    sudo apt-get install gdebi-core
    export R_VERSION=${R_VERSION}
    mkdir ~/Rversions/
    curl -o ~/Rversions/r-${R_VERSION}_1_amd64.deb https://cdn.rstudio.com/r/ubuntu-2004/pkgs/r-${R_VERSION}_1_amd64.deb
#    mv r-${R_VERSION}_1_amd64.deb > ~/Rversions/
    sudo gdebi ~/Rversions/r-${R_VERSION}_1_amd64.deb
fi

#sudo sed -i 's|^\(rsession-\).*||g' /etc/rstudio/rserver.conf
#newline="rsession-which-r=/opt/R/${R_VERSION}/bin/R"
#echo $newline | sudo tee -a /etc/rstudio/rserver.conf
export "RSTUDIO_WHICH_R=/opt/R/${R_VERSION}/bin/R"
rstudio &
