setwd("C:/Users/Brent/Documents/Project Files (local_laptop)/marta-diff")
folder1 <- "marta_201411"
folder2 <- "marta_201511"

# get data for marta1 file
marta1.agency <- read.csv(paste(folder1,"agency.txt",sep="/"),stringsAsFactors=FALSE)
marta1.calendar <- read.csv(paste(folder1,"calendar.txt",sep="/"),stringsAsFactors=FALSE)
marta1.calendar_dates <- read.csv(paste(folder1,"calendar_dates.txt",sep="/"),stringsAsFactors=FALSE)
marta1.routes <- read.csv(paste(folder1,"routes.txt",sep="/"),stringsAsFactors=FALSE)
marta1.shapes <- read.csv(paste(folder1,"shapes.txt",sep="/"),stringsAsFactors=FALSE)
marta1.stop_times <- read.csv(paste(folder1,"stop_times.txt",sep="/"),stringsAsFactors=FALSE)
marta1.stops <- read.csv(paste(folder1,"stops.txt",sep="/"),stringsAsFactors=FALSE)
marta1.trips <- read.csv(paste(folder1,"trips.txt",sep="/"),stringsAsFactors=FALSE)

# get data for marta2 file
marta2.agency <- read.csv(paste(folder2,"agency.txt",sep="/"),stringsAsFactors=FALSE)
marta2.calendar <- read.csv(paste(folder2,"calendar.txt",sep="/"),stringsAsFactors=FALSE)
marta2.calendar_dates <- read.csv(paste(folder2,"calendar_dates.txt",sep="/"),stringsAsFactors=FALSE)
marta2.routes <- read.csv(paste(folder2,"routes.txt",sep="/"),stringsAsFactors=FALSE)
marta2.shapes <- read.csv(paste(folder2,"shapes.txt",sep="/"),stringsAsFactors=FALSE)
marta2.stop_times <- read.csv(paste(folder2,"stop_times.txt",sep="/"),stringsAsFactors=FALSE)
marta2.stops <- read.csv(paste(folder2,"stops.txt",sep="/"),stringsAsFactors=FALSE)
marta2.trips <- read.csv(paste(folder2,"trips.txt",sep="/"),stringsAsFactors=FALSE)

# compare 2 files in each table
tables <- c("agency","calendar","calendar_dates","routes","shapes","stop_times","stops","trips")
for(i in 1:length(tables)){
          table1 <- get(paste("marta",1,".",tables[i],sep=""))
          table2 <- get(paste("marta",2,".",tables[i],sep=""))
               table1$allvals <- apply(table1, 1,
                                    function(x){
                                             allcol <- character()
                                             for(k in 1:length(x)){
                                                  allcol <- paste(allcol, x[k], sep="")
                                             }
                                   allcol
                                   }
                              )
               
               table2$allvals <- apply(table2, 1,
                                   function(x){
                                        allcol <- character()
                                             for(k in 1:length(x)){
                                                 allcol <- paste(allcol, x[k], sep="")
                                            }
                                            allcol
                                       }
                                   )
               assign(paste0("marta1.",tables[i],".extracol"), table1$allvals)
               assign(paste0("marta2.",tables[i],".extracol"), table2$allvals)
}


## Sandbox
## -------
apply(get(paste0("table",1)), 1,
      function(x){
           allcol <- character()
           for(i in 1:length(x)){
                allcol <- paste(allcol, x[i], sep="")
           }
           allcol
      }
)
