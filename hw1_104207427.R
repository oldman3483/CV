########################
# homework1 author: Jacky Li 
########################

args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("USAGE: Rscript hw1_exam.R need input & output", call.=FALSE)
} else {
  if(args[1]=='--input'){
    input_name <- args[2]
    if(args[3]=='--output'){
      output_name<-args[4]
      
    }else{
      stop("Please input the right argument's  name '--input'/'--output'. ", call.=FALSE)
    }
  }else if(args[1]=='--output'){
    output_name<-args[2]
    if(args[3]=='--input'){
      input_name<-args[4]
    }else{
      stop("Please input the right argument's  name '--input'/'--output'. ", call.=FALSE)
    }
  }else{
    stop("Please input the right argument's  name '--input'/'--output'. ", call.=FALSE)
  }
}
#path = "~/Desktop/CS_course/DataScience/hw1/hw1-oldman3483/example/input2.csv"
input<-read.table(input_name, header = FALSE, stringsAsFactors = FALSE, sep = ",")

i<-1
col_num<-dim(input)[2]
row_num<-dim(input)[1]
while (i<=col_num){
  if(input[1,i]=='weight'){
    weight_index<-i
  }
  if(input[1,i]=='height'){
    height_index<-i
  }  
  i<-i+1
}
max_w<-0
max_h<-0
i_weight<-2
while(i_weight<=row_num){
  if(input[i_weight,weight_index]>max_w){
    max_w<-input[i_weight,weight_index]
    
  }
  if(input[i_weight,height_index]>max_h){
    max_h<-input[i_weight,height_index]
    
  }
  i_weight<-i_weight+1
}

max_h <- as.numeric(max_h)
max_w <- as.numeric(max_w)
max_h = round(max_h, digits = 2)
max_w = round(max_w, digits = 2)

name <- strsplit(input_name, split = "/")
name <- name[[1]][length(name[[1]])]
filename <- strsplit(name, split = ".csv")
outputname <- as.character(filename)
set <- c(outputname)
weight <- c(max_w)
height <- c(max_h)
max_output <- data.frame(set, weight, height)

write.csv(max_output,file = output_name,row.names = FALSE)
