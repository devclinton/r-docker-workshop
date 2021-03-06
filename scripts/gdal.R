library(rgdal)
# based on https://nceas.github.io/oss-lessons/spatial-data-gis-law/3-mon-intro-gis-in-r.html
download.file("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/physical/ne_10m_coastline.zip", 
              destfile = 'coastlines.zip')

# unzip the file
unzip(zipfile = "coastlines.zip", 
      exdir = 'ne-coastlines-10m')

# load the data 
coastlines <- readOGR("ne-coastlines-10m/ne_10m_coastline.shp")

plot(coastlines, 
     main = "Global Coastlines")