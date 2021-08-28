library(rnaseqDTU)
data(salmon_cts)
cts[1:3,1:3]
csv.dir <- system.file("extdata", package="rnaseqDTU")
samps <- read.csv(file.path(csv.dir, "samples.csv"))
head(samps)
samps$condition <- factor(samps$condition)
table(samps$condition)
files <- file.path("/path/to/dir", samps$sample_id, "quant.sf")
names(files) <- samps$sample_id
head(files)
library(tximport)
txi <- tximport(files, type="salmon", txOut=TRUE,
                countsFromAbundance="scaledTPM")
cts <- txi$counts
cts <- cts[rowSums(cts) > 0,]