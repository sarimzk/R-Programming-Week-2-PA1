#takes a directory of data files and a threshold for complete cases and
#calculates the correlation between sulfate and nitrate for monitor locations
#where the number of completely observed cases (on all variables) is greater 
#than the threshold
corr <- function(threshold = 0){
  directory <- ("./specdata/")
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory))
  file_paths <- paste(directory, all_files, sep="")
  corr_vect <- c()
 
  for(i in 1:332){
    cur_file <- read.csv(file_paths[i], header=T, sep=",")
    head(cur_file)
    comp_cases <- cur_file[complete.cases(cur_file),]
    nrow(comp_cases)
    if(nrow(comp_cases) > threshold){
      corr_vect <- c(corr_vect, cor(comp_cases[,"sulfate"], comp_cases[,"nitrate"]))
    }
  }
  corr_vect
}