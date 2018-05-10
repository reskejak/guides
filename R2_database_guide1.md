# R2: Genomics Analysis and Visualization Platform
#### http://hgserver1.amc.nl/cgi-bin/r2/main.cgi
### Guide for Single-Gene Tissue Expression Analysis

1. Visit URL (above) or Google search “R2 Database” and select the first result.
   * This is the homepage:
    
![1](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/1.png)

2. Select “Change Species” in the upper-left corner, and select for either “Human”, “Mouse”, or “Rat”.

![2](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/2.png)

3. In the center of the screen, select “Change Dataset”.

![3](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/3.png)

4. The pull-down menu gives a list of all available datasets for gene expression analysis. The first subset of text is usually a description, followed by its creators/developers, followed by array normalization method (MAS5.0, for example), and followed finally by the chiptype.
   * MAS5.0 is generally considered a newer and better normalization technology.
   * For analysis of a range of normal, healthy mouse tissue, use “Normal various – Lattin – 182 – MAS5.0 – mm4302”.

![4](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/4.png)

5. After selecting a dataset, insert a gene name/keyword or probe into the field in the center of the screen and press “Next”.
   * You can also click the bubbled i icon for more information on your dataset.

![5](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/5.png)

6. A list of all available probes for the given gene should appear. The “Avg=‘x’” value at the end of the probe name indicates how “strong” the probe is. A higher-valued probe (‘x’>100) is more likely to give significant data for analysis than a weaker probe

![6](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/6.png)

7. You will be presented with a graph. For now, look at the bottom settings. I’ve found the following settings to work well:
   * Adjust “Group Separations” to “tissue”
   * Adjust “Graphtype” to “BoxDotPlot”
   * Adjust “Transform” to “none”
   * Click “Adjust Settings”

![7](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/7.png)

8. Here’s your “final product”: a graph showing absolute gene expression on the Y-axis separated by different tissue types viewed on the X-axis. Each dot on the plot shows a datapoint, and the light-blue bar shows an average range for the expression. More datapoints = more likely to be significant. Alternatively, setting the “Transform” feature to “2log” will present more of a relative expression scale.

![8](https://raw.githubusercontent.com/reskejak/guides/master/R2_database_guide1/8.png)

9. In the upper right corner, at any time you can change your gene of interest by typing in a name/keyword/probe into the “Change Gene” field. At this point, you will repeat step 6 and return to your pre-adjusted plot for that gene.

#### I hope this helps in your analysis and research in some way. R2 is a very powerful database with many more features, e.g. gene:gene correlation. Good luck!
