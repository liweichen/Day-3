*Load the biofam data set that comes with the TraMineR library.*
> library (TraMineR)
> data (biofam)

*Create a weighted state sequence object named biofam.seq with variables a15 to a30.*
> biofam.lab<-c("Parent", "Left", "Married", "Left/Married", "Child", "Left/Child", "Left/Married/Child", "Divorced")
> biofam.shortlab<-c("P", "L", "M", "LM", "C", "LC", "LMC", "D")
> biofam.seq<-seqdef (biofam[, 10:25], states=biofam.shortlab, lables=biofam.lab, weights=biofam$wp00tbgs, xstep=8)
> biofam$AgeGroup <- cut (biofam$birthyr, c("1900","1930","1940","1950", "1960"), lables=c("1990-1929", "1930-1939", "1940-1949", "1950-1959"), right=FALSE)

*Create a full sequence index plot sorted from the end for each class of the cohort variable created in assignment 2.*
> seqIplot(biofam.seq, group=biofam$AgeGroup, sortv="from.end")

*Print the frequencies of the rst 20 sequences.*
> seqtab(biofam.seq, tlim=1:20)

*Create a sequence frequency plot of the 20 most frequent patterns grouped by values of the cohort variable and save it as a `jpeg' file."
> seqfplot (biofam.seq, group=biofam$AgeGroup, tlim=1:20)
> dev.off()

*Compute the transition rate matrix for the biofam data set7.*
> round(seqtrate(biofam.seq), digits = 4)
*What is the transition rate between states `Left/Married' and `Left/Married/Child'?*
*The transition rate from LM to LMC is 0.1843.*

*Display the sequence of transversal state distributions by cohort 9.*
> seqdplot (biofam.seq, group=biofam$AgeGroup)

*Within each cohort, at what age is the diversity of the transversal state distribution at its highest?*
> sd<-seqstatd (biofam.seq)
> sd$Entropy
> names (biofam.seq) [which (sd$Entropy==max(sd$Entropy))]

*Display side by side in a same plot area the mean times spent in each of the states and the sequence of modal states.*
> par(mfrow=c(1,3))
> seqmtplot(biofam.seq, withlegend=FALSE, border=NA, xtstep=8)
> seqmsplot(biofam.seq, withlegend=FALSE, border=NA, xtstep=8)
> seqlegend(biofam.seq,fontsize=1.8)

