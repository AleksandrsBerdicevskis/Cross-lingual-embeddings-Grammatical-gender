options(scipen=999)

library("lmerTest")	

#model <- glmer(correct ~ freq * animacy * baseform * distance + (1 + freq * animacy * baseform * distance | sourcelang) + (1 + freq * animacy * baseform * distance | target), data = results)

results <- read.csv(file="fullregr.tsv", sep = "\t", header=TRUE, dec=".")

results_noh <- results[results$target != "hi",]
results_h <- results[results$target == "hi",]

model <- glm(correct ~ freq * animacy * baseform * distance, family = binomial, data = results_noh)
print(summary(model))

model <- glm(correct ~ freq * animacy * distance, family = binomial, data = results_h)
print(summary(model))

results <- read.csv(file="fullregr_sem.tsv", sep = "\t", header=TRUE, dec=".")
results_noh <- results[results$target != "hi",]
results_h <- results[results$target == "hi",]

model <- glm(correct ~ freq * animacy * baseform, family = binomial, data = results_noh)
print(summary(model))

model <- glm(correct ~ freq * animacy, family = binomial, data = results_h)
print(summary(model))
