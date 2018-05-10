# R2: Genomics Analysis and Visualization Platform
#### http://hgserver1.amc.nl/cgi-bin/r2/main.cgi
### Guide for gene:gene Expression Correlation Analysis

##### Firstly read “Guide for Single-Gene Tissue Expression Analysis” for general introduction to navigating the database

1. Visit URL and change species and dataset for desired study.
   * For this example: Human; Tumor Liver Hepatocellular Carcinoma – TCGA – 371 – rsem – tcgars
   
![1](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/1.png)

2. In subset #3, “type of analysis”, select “Correlate 2 genes”

![2](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/2.png)

3. In subset #4, insert your two genes of interest for which you would like to analyze expression correlation in your dataset, and then proceed by selecting “Next” in subset #5.
   * Most relevant genes to the dataset should be available
   * For this example: type “NCOA5” and “PDK4” into respective fields “Gene 1 / Probeset 1” and “Gene 2 / Probeset 2”

4. You will be presented with the following screen:

![3](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/3.png)

5. Select your probes of interest (if there are multiple) and hit “Next” at the bottom.

6. You will be presented with a new screen including a graph and statistical information about the correlation.

![4](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/4.png)

7. In order to change the graph into something more intuitive, change “Graphtype” to “XY-plot” and “Transform” to “zscore”.
   * “XY-plot” returns a Principal Component Analysis (PCA) type of plot, and “zscore” plots samples based on standard deviation.
   * I have found these selections work best for my needs, but you can experiment by choosing different options that may better suit your analyses.

![5](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/5.png)

8. After clicking “Adjust Settings”, you will be presented with a visually-appealing graph that allows easy interpretation of your gene:gene correlation:

![6](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/6.png)

9. If you wish to further overlay a linear fit line, at the bottom of the page you can click “More Settings” > “Linear Fit” > “on”.

![7](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/7.png)

10. Once you have your settings in place, it is becomes easy to probe many different correlation combinations via the upper-right hand corner. Type in new genes of interest, click “Change Genes”, and select desired probes if needed.

![8](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide2/8.png)

The result of this analysis is a statistical correlation (or non-correlation) between two genes in a dataset. In this example, each dot represents an HCC patient’s expression for both genes (gene in direction of axis) of N=371 to create a statistical correlation. Our conclusion is that NCOA5 expression is inversely correlated with PDK4 expression, and NR4A1 is positively correlated with NFIL3, both with p<0.05, in this dataset of 371 HCC patients.

Final Notes: your most useful results of this analysis will inevitably be the outputted r-value (correlation coefficient, R) and p-value (calculated probability, p)! Additionally, you can right-click graph outputs to save them as images.
