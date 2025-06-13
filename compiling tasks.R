chapter.folders <- list.dirs(path = './tasks',recursive=F)
parameters <- c(TRUE,FALSE)
names <-c('.code','.nocode')
mainfolder <- getwd()
savingfolder <- paste0(mainfolder,'/_book/exercises/')

for (chapter in chapter.folders){
  tasks <- list.files(chapter)
  for (task in tasks){
    if(!grepl("\\.Rmd$", task)) {
      message(sprintf("Skipping file '%s' (not with extension .Rmd)...", task))
      next
    }
    nametask <- substr(task,1,nchar(task)-4)
    for (version in 1:2){
      param = parameters[version]
      rmarkdown::render(input = paste(chapter,task,sep='/'),
                        output_format = rmarkdown::html_document(
                          toc=TRUE,
                          toc_float=list(collapsed=FALSE),
                          number_sections=TRUE
                        ),
                        output_file = paste0(savingfolder,nametask,names[version],'.html'))
    }
  }
}

