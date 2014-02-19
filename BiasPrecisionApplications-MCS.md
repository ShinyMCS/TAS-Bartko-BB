### Bias and Precision in the context of agreement.

Many authors (Bartko 94, Hubbart) assert that for two methods to be considered in agreement, they must have equivalent precision and negligible inter-method bias.
When considering bias and precision in this context, two interesting scenarios arise.

In the first scenario, let two methods have equivalent measurement precision, but differ due to inter-method bias. In this case, exchangability is still viable, as this inter-method bias may be accounted for in calculations.

In the second scenario, consider two methods of measurement that have negligible but have differing levels of precision. In this case exchangability is not viable, as the less precise method can not be considered equivalent to its more precise counterpart.

Considering this, a useful approach is a sequential testing of both hypotheses, whereby the usefulness of the test of inter-method bias is contigent on the outcome of the test for equivalent precision.

<hr>

### Application of Procedures.

Bartko (1994) discusses the application of such omnibus procedures (in particular Bradley and Blackwood) as a means 
of assessing the agreement of two methods of measurement, a discipline commonly referred to as Method Comparison 
Studies. In the context of method comparison studies, equivalent precision and a lack of bias between measurements are a ncessary condtion for two methods to be in agreement.


A key advancement in the formulation of statistical techniques appropriate for comparing methods of measurement was Bland Altman 86, which progressed some 
earlier ideas (Bland-Altman 83), and has since become ubiquitous in medical literature (in excess of 27,000 
citations at time of writing).

Inter-alia, Bartko (1994) seeks to complement these prevalent method comparison techniques with formal hypothesis tests, and demonstrate how an
omnibus test (i.e. Bradlye and Blackwood) may be used to test agreement, by means of a joint test on bias and precision.

Indeed, various other method comparison techniques have been proposed on an ongoing basis in the intervening period (Kroower Monti 1995 
, Choudhary and Nagaraja 2007, Huston 2010, Costa-Santos et al 2010, Liao & Capen 2011).


### Mean Centering
Centering predictor variables is one of those simple but extremely useful practices that is easily overlooked.

It’s almost too simple.

Centering simply means subtracting a constant from every value of a variable.  What it does is redefine the 0 point for that predictor to be whatever value you subtracted.  It shifts the scale over, but retains the units.

The effect is that the slope between that predictor and the response variable doesn’t change at all.  But the interpretation of the intercept does.

The intercept is just the mean of the response when all predictors = 0.  So when 0 is out of the range of data, that value  is meaningless.  But when you center X so that a value within the dataset becomes 0, the intercept becomes the mean of Y at the value you centered on.

What’s the point?  Who cares about interpreting the intercept?

It’s true.  In many models, you’re not really interested in the intercept.  In those models, there isn’t really a point, so don’t worry about it.

But, and there’s always a but, in many models interpreting the intercept becomes really, really important.  So whether and where you center becomes important too.

A few examples include models with a dummy-coded predictor, models with a polynomial (curvature) term, and random slope models.
