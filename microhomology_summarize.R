library(Biostrings,warn.conflicts = F,logical.return = F,verbose = F)
genome = readDNAStringSet("GCF_000002035.5_GRCz10_genomic.fna")
window.size = 1000
dir.create("summary_GCF_000002035.5_GRCz10_genomic")
arg = commandArgs(trailingOnly = T)
k = as.integer(arg[2])
chr = as.integer(arg[1])
for(l in seq(50,200,50)){
  len = length(genome[[chr]])
  pass = rep(0, len)
  file = sprintf("microhomology_GCF_000002035.5_GRCz10_genomic/kmer%02d_chr%02d_maxLength%03d.csv",k,chr,l)
  # cat(file,"\n")
  csv = read.csv(file)
  csv$end = csv$sp+csv$end-1
  for(i in 1:nrow(csv)){
    sp = csv[i,2]-window.size+1
    if(sp<0){
      sp= 1
    }
    ep = csv[i,1]
    # cat(i," ",sp," ",ep,"\n")
    pass[sp:ep] = 1
  }
  write.csv(data.frame("pass"=length(which(pass!=0)), "total" = length(pass)), file = sprintf("summary_GCF_000002035.5_GRCz10_genomic/kmer%02d_chr%02d_maxLength%03d.csv",k,chr,l))
}
