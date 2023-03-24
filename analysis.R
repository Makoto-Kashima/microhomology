# ruby multi.rb # Searching microhomology
# ruby multi2.rb # Checking w/wo microhomology within 1k bp

# Making figure
summary = NULL
for(k in 6:10){
  for(chr in 1:25){
    for(maxLength in seq(50,200,50)){
      file = read.csv(sprintf("summary_GCF_000002035.5_GRCz10_genomic/kmer%02d_chr%02d_maxLength%03d.csv",k, chr, maxLength))
      data = data.frame("kmer" = k, "chr" = chr, "insert" = maxLength, "pass.rate" = file$pass/file$total)
      summary = rbind(summary,data)
    }
  }
}

library(ggplot2)
ggplot(summary,aes(y = pass.rate, x = insert))+
  geom_bar(stat = "identity")+
  facet_grid(kmer~chr)

write.csv(summary,file = "microhomology_summary.csv")
