## setup
import time
mintrials = 3#this is very slow, let's do only 3

def timeit(name):
    tmin = float('inf')
    for i in range(mintrials):
        t = time.time()
        f = main()
        t = time.time()-t
        if t < tmin: tmin = t

    print(name + "\t" + str(tmin*1000))

## benchmarks here
import pysam, os, numpy as np

def main():
    bamfile = os.path.join(os.path.dirname(__file__),"../../../../Data/wgEncodeUwRepliSeqK562G1AlnRep1.bam")
    reader = pysam.AlignmentFile(bamfile, "rb", index_filename = bamfile + '.bai')

    out,n = 0.0, 0
    for read in reader.fetch():
        out += np.mean(read.query_alignment_qualities)
        n += 1

    reader.close()
    return out/n

assert main() == 51.061717683307776
timeit("Computing mean quality of reads")
