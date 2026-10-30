# Reliability and Validity

## Before You Start

Psychology and the social sciences often study constructs that are not very concrete, such as resilience. Compared with variables that can be observed directly, like height and weight, these are abstract. Scientists therefore give these abstract variables an operational definition, and validity tells you whether the results of your measurement accurately reflect the nature of the abstract variable.

**Split-half reliability:** Divide the scale into two halves by a rule (odd- and even-numbered items, or the first and second half), compute the total score of each half, and correlate the two totals. Because this correlation describes a half-length scale, correct it with the Spearman-Brown formula to estimate the reliability of the full scale.

**Construct validity:** Whether the concept the scale measures fits the theory about related concepts, i.e., whether the scale's items are consistent with the dimensions they are meant to measure.

**Face and content validity:** Whether, on the surface and in its content (indicators), the scale can accurately measure the variable. Content validity is usually evaluated by inviting experts to discuss and rate the items.

R package: [bruceR](https://cran.r-project.org/package=bruceR)

## Basic Procedure

## Report Results

## Summary and Practice

## Syntax

### Subscales and total scales

```r
library(bruceR)
library(GPArotation)
Alpha(data2, varrange="BSI1:BSI6")
Alpha(data2, varrange="BSI7:BSI12")
Alpha(data2, varrange="BSI13:BSI18")
Alpha(data2, vars=cc("SLE_DisturbingDreams, SLE_Relivingit, SLE_RemindedUpset, SLE_PhysicalReactions, SLE_DisturbingThoughts"))
Alpha(data2, vars=cc("SLE_AvoidThinking, SLE_AvoidActivities, SLE_TroubleRemembering, SLE_LossofInterestActivities, SLE_DistantfromPeople, SLE_EmotionallyNumb, SLE_FutureShortened"))
Alpha(data2, vars=cc("SLE_FallingorStayingSleep, SLE_Irritable, SLE_Concentrating, SLE_SuperAlert, SLE_EasilyStartled"))

Alpha(data2, varrange="BSI1:BSI18")
Alpha(data2, varrange="SLE_DisturbingThoughts:SLE_EasilyStartled")

Alpha(data2, varrange="ACE1:ACE10")
```

### Reverse-coded items, with psych::bfi

```r
# ?psych::bfi
data = psych::bfi
Alpha(data, "E", 1:5) # "E1" & "E2" should be reversed
Alpha(data, "E", 1:5, rev=1:2) # correct
Alpha(data, "E", 1:5, rev=cc("E1, E2")) # also correct
Alpha(data, vars=cc("E1, E2, E3, E4, E5"), rev=cc("E1, E2"))
Alpha(data, varrange="E1:E5", rev=cc("E1, E2"))

# using dplyr::select()
data %>% select(E1, E2, E3, E4, E5) %>%
  Alpha(vars=names(.), rev=cc("E1, E2"))
```

## Resources & References

### Further Study

- [Research Methods for the Social Sciences, Chapter 7: Scale reliability and validity](https://courses.lumenlearning.com/suny-hccc-research-methods/chapter/chapter-7-scale-reliability-and-validity/)
