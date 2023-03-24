import sys
from Bio import SeqIO
from Bio.Seq import Seq
import pandas as pd
args = sys.argv
chr = int(args[1])-1
# kmer = int(args[2])
maxLength = int(args[2])
fasta_file = "GCF_000002035.5_GRCz10_genomic.fna"
records = list(SeqIO.parse(fasta_file, "fasta"))
seq = records[chr].seq
for kmer in range(6,11):
  list = []
  for i in range(1,(len(seq)-maxLength)):
    short = seq[i:(i+kmer)]
    flag = short.find("N")
    if flag == -1:
      shortRevC = short.reverse_complement()
      fragment = seq[i:(i+maxLength-1)]
      pos = fragment.find(shortRevC,start = kmer+11)
      if (pos > 0):
        # Pass.append(i)
        tmp = [i, pos + kmer]
        # print(tmp)
        # print(short)
        # print(fragment)
        list.append(tmp)
  df = pd.DataFrame(list,columns= ["sp","end"])
  df.to_csv("microhomology_GCF_000002035.5_GRCz10_genomic/kmer%02d_chr%02d_maxLength%03d.csv" % (kmer,chr+1, maxLength), index=False)
    # df = pd.DataFrame([Pass]).transpose()
    # df.to_csv("summary_GCF_000002035.5_GRCz10_genomic/kmer%02d_chr%02d_maxLength%d.csv" % (kmer,chr, maxLength),header = False, index=False)
