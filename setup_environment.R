# This script will ensure all of our required R packages are installed

pkgLoad <- function(packages) {

    packagecheck <- match( packages, utils::installed.packages()[,1] )
    packagestoinstall <- packages[ is.na( packagecheck ) ]
    if( length( packagestoinstall ) > 0L ) {
        utils::install.packages( packagestoinstall)
    } else {
        print( "All requested packages already installed" )
    }
}

pkgLoad(
    c(
    "DCluster",
    "rattle"
    )
)

# Here is an example of installed from an archived version
# Install RGdal from archive since 16.04 has an older version of gdal which rgdal depends on
#utils::install.packages("https://cran.r-project.org/src/contrib/Archive/rgdal/rgdal_1.2-20.tar.gz", repos=NULL, type="source")