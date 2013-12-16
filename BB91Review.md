### An Omnibus Test for Comparing Two Measuring Devices

#### author: Larry Blackwood and Edwin Bradley
- Bradley and Blackwood propiose a methodology for assessing bias and precision in measurement instruments.
- The authors state that the procedure controls the FWER, and as such is more useful than the individual procedures themselves.
- The procedure depends heavily on the assumption of normality

<!------------------------------------------------------------------------>
<!---- Page 12 ---->
#### Background: Grubbs's Model (1983)
*Model used for assessing bias and precision using paired data.*

Grubbs (1948, 1973, 1983) proposed a model for $n$ items, each measured by $p$ (usually $p=2$ instruments) such that,
\[ Y_ij =X_i + \alpha_j +e_ij \].

- $x_i$is the characteristic of interest in the i-th experimental unit
- $\alpha_j$ bias for instrument $j$
- $e_{ij}$ is the random error associated with each measurement.

In the literature it is assumed that $x_{i}$ and $e_{ij}$ are independent with normal distributions.

#### Background: Pitman's Test 

\[ H_o : \sigma^2_{e1} =  \sigma^2_{e1}\]
<!------------------------------------------------------------------------>
<!---- Page 13 ---->

#### Derivation of Omnibus test

The derivation of the test given by Bradley and Blackwood

\[ E(D_i|S_i) = \beta_0 + \beta_1S_i\]

Condition; if $\beta_0 =\beta_1=0$

<!------------------------------------------------------------------------>
<!---- Page 14 ---->
#### Time Fuse Data

Grubbs used Pitman's test to determine there is no difference in precision between both sets of measurements.
However, a highly significant bias exists.

Blackwood and Bradley analyse the data set using their omnibus procedure.

