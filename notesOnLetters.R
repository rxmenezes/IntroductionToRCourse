v <- 101:110
LETTERS[ 1:length(v) ]
names(v) <- LETTERS[ 1:length(v) ]

heightInch <- function(x){ x/2.54 }
survey$heightInch <- sapply(X=survey$height, FUN=heightInch)
