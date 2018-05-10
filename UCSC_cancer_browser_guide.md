# UCSC Cancer Browser
#### https://genome-cancer.ucsc.edu/proj/site/hgHeatmap/
### Guide for human clinical patient data analysis

1. Visit URL above. Initial working homepage should look like this:

![1](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/1.png)

2. Click “Add Datasets” in the upper left corner.

![2](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/2.png)

3. Scroll down to whichever major study/carcinoma you’re interested in using, and click the name to expand and show individual datasets.

![3](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/3.png)

4. Clicking any of the dataset names will add them to your working homepage for analysis and mark them on this list as currently using.
   * Look at other fields listed for relevant information to help with choosing a dataset
   * “N” value corresponds to number of samples in dataset
   * For this example, click “LIHC gene expression (IlluminaHiSeq)” for RNA-seq gene expression data from 423 HCC patients

![4](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/4.png)

   As a note, hovering over a dataset will present you with two additional options: acquire additional information about the dataset (click the circled ‘i’), or download the dataset for exterior analysis (click the arrow pointing downward). Also, you can add as many datasets to working homepage as you would like.

![5](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/5.png)

5. Close out of the “Add Datasets” page by clicking the ‘X’ in the upper-right corner. We will not be needing the stock dataset that came preloaded, “TCGA brain low grade glioma (LGG) …”, so you can remove it as well by clicking the ‘X’ on the upper-right corner of the dataset’s graphics frame.
   * If you haven’t already done so, click “Genes” near the top to access more relevant gene expression data (vs. chromosome)

![6](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/6.png)

6. Near the top, insert abbreviated names of any genes of interest you would like to study, separated by commas or spaces, and click “Go”.
   * Try “NCOA5, PDK4, ESR1”

![7](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/7.png)

7. Now you have a working homepage that can be used for basic visual analysis. Hovering over anywhere on this graphic will present you with detailed information in the top-center of the page in a blue box. Each horizontal line represents a patient, and the columns denote different fields by which to sort and group patients.

![8](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/8.png)

8. Currently patients are grouped by column “sample type” which consists of three sub-groups: “Solid Tissue Normal”, “Recurrent Tumor”, and “Primary Tumor” (in ascending order). After sorting by “sample type”, patients are then sorted by “grade”, then “percent stromal cells BOTTOM”, etc.
   a. We can change to sort by another column by clicking anywhere within the column and clicking “move to first”.
   b. Click “grade”, then “Move to 1st”

![9](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/9.png)

9. Now samples are sorted by column “grade”—otherwise known as “neoplasm histologic grade” as stated in “feature” field of upper blue description box—in ascending order of “G4”, “G2”, “G1”, “G3”, “N/A”.

![10](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/10.png)

10. As a side note, to help better visualize differences in PDK4 and ESR1, click the colorbar near the top of the heatmap, and change the color values from “1.0” to “2.0”, then press enter.

![11](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/11.png)

11. At this time, we can generate a Kaplan-Meier survival plot of these patients by clicking “KM”, or “Tools”>”Kaplan-Meier Plot”, located adjacent to the colorbar option toggle used in the last step.

    The following graph will be presented on screen. This plot shows us a breakdown of survival, as curated by the study group based on patient follow-up, for each patient group. Visually, the results might be what we would expect: patients with a more aggressive tumor (G3/G4) tended to die more quickly than patients with a lower grade tumor (G1).
    * _To my knowledge, there is no ability to compute statistics from this graphic without downloading the data and manually creating the curves in a statistical environment._
    * This plot does not take any genes into consideration, solely the tumor grade by which samples were sorted.
    * This analytical method can be extrapolated to any of the other curated columns listed, like “sample type”, etc.

![12](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/12.png)

12. Creating a gene signature allows a Kaplan-Meier plot to be created utilizing survival data based on a given gene’s expression distribution over the samples. Go to “Tools”>”Signatures” to bring up the following menu:

![13](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/13.png)

   Type in a gene of interest, and click “Update” to create a new column that sorts the samples based on this gene. Then view the new Kaplan-Meier plot using either method described in step #11.

![14](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/14.png)

   This plot does not provide us much information visually, and without statistics it is not possible to take much inference from it. However, ranking samples by another gene for survival analysis may potentially yield stronger results.

   Final note for gene signatures: TCGA Cancer Browser does have an option to sort samples based on more than one genes, but its method is a bit obscure (arithmetic manipulation of multiple gene expression values). An example input for adding the expression values of multiple genes would look like this:

![15](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/15.png)
![16](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/16.png)
![17](https://raw.githubusercontent.com/reskejak/guides/master/UCSC_cancer_browser_guide/17.png)

   From the results of the 16-gene “signature” on the previous page, which consisted of (for each sample) adding together the normalized expression values of a list of genes, it looks like there may be a significant difference in survival after 3 years for a group of ~25% of the patients. Without statistics, however, it is not possible to state this matter of fact. Perhaps simple addition of all normalized expression values is not the best way to approach this type of analysis, so further exploration may yield better results.
