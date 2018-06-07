#reads a directory full of files and reports the number of completely observed cases in each data file
complete <- function(id = 1:332){
  directory <- ("./specdata/")
  comp <- data.frame()
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  for(i in id){
    curr_file <- read.csv(file_paths[i], header=T, sep=",")
    head(curr_file)
    nobs <- sum(as.numeric(complete.cases(curr_file)))
    
    data9 <- data.frame(i, nobs)
    comp <- rbind(comp, data9)
  }
  return(comp)
}