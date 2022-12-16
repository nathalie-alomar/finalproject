# Phylogenetic Biology - Final Project

## Guidelines - you can delete this section before submission

This is a stub for your final project. Edit/ delete the text in this readme as needed.

There are two ways you can use this document:  
- You can download this file to a folder on your computer, edit this document and add other files (data, code, etc), and then zip up and submit the folder on canvas.
- You can for the [repository](finalproject) containing this document on gitub. Then commit and push your canges to the repository, and submit a link to the repository on canvas.

Github is a great way to work on projects, but also has a steep initial learning curve.


Some guidelines and tips:

- Use the stubs below to write up your final project. Alternatively, if you would like the writeup to be an executable document (with [knitr](http://yihui.name/knitr/), [jupytr](http://jupyter.org/), or other tools), you can create it as a separate file and put a link to it here in the readme.

- For information on formatting text files with markdown, see https://guides.github.com/features/mastering-markdown/ . You can use markdown to include images in this document by linking to files in the repository, eg `![GitHub Logo](/images/logo.png)`.

- The project must be entirely reproducible. In addition to the results, the repository must include all the data (or links to data) and code needed to reproduce the results.

- If you are working with unpublished data that you would prefer not to publicly share at this time, please contact me to discuss options. In most cases, the data can be anonymized in a way that putting them in a public repo does not compromise your other goals.

- Paste references (including urls) into the reference section, and cite them with the general format (Smith at al. 2003).

OK, here we go.

# Physiological Trait Variation in lungless salamanders (Plethodon)

## Introduction and Goals

The goal of my project is to answer the question, what is the physiological diversification across the Plethodon genus? Woodland salamanders (Genus Plethodon) are terrestrial and found primarily in the eastern and southern United States. Species can vary widely in geographic range sizes, with several species being montane endemics, restricted to one or a few nearby peaks and others occupying large ranges (Marvin, 1996; Highton, 1995). The geographic range of the eastern redback salamander (P. cinereus), for example, spans 14 degrees of latitude (Markle and Kozak 2018). The eastern Plethodon salamanders have three main sub-lineages: P. cinereus, P. glutinosus, and P. welleri/wehrlei, with the latter two being sister taxa (Highton et al., 2012) (Figure 1). There are few morphological differences within each sub-lineage, with multiple species first identified through genetic analyses (Highton, 1995). As lungless salamanders, they rely on cutaneous respiration, and are correspondingly highly sensitive to their environments, specifically to temperature and humidity (to minimize water loss and ensure cutaneous respiration). 

Understanding Plethodon physiology can generate greater insight into the dynamics of diversification.  A phylogenetic perspective is a crucial component for comparison studies as we must consider species’ degrees of relatedness (Glor, 2010). A proposed chapter of my thesis is to collect tail tips from all the individuals that go through the physiological trials and create a high-quality population- and species-level tree to understand patterns of relatedness and introgression. While a broader salamander tree is available, the genetic information used to build those trees is limited and relatively antiquated when compared with more modern approaches (Kozak et al., 2006; Weisrock et al., 2018; Vietes et al., 2010; Highton et al., 2012). While I will not have the sequences nor all of the trait data available for this project, I hope to use similar methods in order to build my own phylogeny. In this project, I infer a phylogeny and map physiological traits from the clade that has the highest diversification rate, P. glutinosus, to see if I can determine any patterns across the clade. 


## Methods

The first sequences were collected from the NADH dehydrogenase subunit 2 (ND2) gene. This was done by going through the NCBI database and collecting sequences from different published projects. In total, 44 sequences were collected representing 32 species across the clade. The sequences were preparead for alignment in visual studio code. Once prepared, they were aligned through MAFT. IQTREE was used to infer the phylogeny and the model was TN+F+I+G4. A bootstrap analysis with 1000 bootstrap was also used to determine the confidence of the phylogeny.

There were some issues in finding enough sequences to fill out the full Plethodon clade. Partly due to the limited amount of data available but also there were many sequences that were using a different gene for sequencing, cytochrome-b. In order to include as many sequences as possible in this project, a second tree was made incorporating cytochrome-b data. This was also beneficial for my own work, since I had sequences that I had collected from the species in my lab. The cytochrome-b file had 83 sequences representing 22 species (including two believed hybrid species from my own data). The same methods from above were used to generate the tree and the model chosen was TIM2+F+I+G4. In the cytochrome-b phylogeny a bootstrap analysis with 1000 bootstrap was also used to infer how confident my sequences were on the tree.

For the final step of this project critical thermal maximum (CTmax), critical thermal minimum (CTmin), and thermal preference (Tpref) of multiple Plethodon species was collected from experiments done in the lab. These traits are important in understanding the physiological thermal limits for a species. Outside of their critical thermal range their performance is at zero and they are likely vulnerable to death. The thermal preference experiments are used to know what temperature an ectotherm would select in the absence of ecological challenges. Put together, these traits have been used to study how species have thermally adapted to their environments. The contMap function in the R package phytools was to map these continuous traits onto the tree. The function estimates states at internal nodes using maximum likelihood (ML) with fastAnc (fast estimation of the ML ancestral states for a continuous trait) and then interpolating the states along each edge. 


## Results

The tree in Figure 1 and 2 show a phylogeny built on the ND2 gene. There are three main clades in Plethodon: cinereus, glutinosus, and wehleri/welleri group. There is large support for the glutinosus and wehleri/welleri group to be sister to each and the cinereus group on the outside. However, in figure 1 cinereus is sister to the wehleri/welleri group. The glutinosus group has been split with some species more closely related to cinereus and wehleri/welleri than to other members of glutinosus. Figure 2 shows the bootstraps had strong support (<95) for the relationships of the three groups. However, in the relationships within has weaker support with values ranging from 60-70. 

![ND2_highlight_page-0001](https://user-images.githubusercontent.com/115576548/207989809-6a3cbec3-dbd4-432c-b8df-a0b43e67b2cf.jpg)

![ND2_bootstrap_page-0001](https://user-images.githubusercontent.com/115576548/207989833-ffd55dc6-b1e0-42d2-9cda-fdcdf2689841.jpg)


The tree in figure 3 and 4 showed sequences that were from the NCBI database except for the tips labeled PshexAur, Paur, PshexTey, Pcyl, Pmet, and PmetxChl. Those samples came from sequences that I was able to produce from the lab. These include three believed hybrid species Plethodon shermani x Plethodon aureolus (Paur), Plethodon shermani x Plethodon teyahalee (PshexTey), and Plethodon metcalfi x Plethodon chlorobryonis (PmetxChl). The hybrids showed to be closely related to at least one parent species (or a species closely related to the parent since not all parent species were found in NCBI). The bootstrap support for how the sequences relate to each other show high support (<95), however how their relationships are to the rest of the species was weaker (83). The tree showed that one species (Plethodon glutinosus) was paraphyletic with individuals being shown to be closer related to other species instead of their own species. Both ND2 and the cytochrome B showed that the species that are known to be apart of each group (cinereus, glutinosus, and wehleri/welleri group) maintained those relationships. However, the cytochrome B tree showed that the glutinosus and  wehleri/welleri group to be sister to each other. 

![CYTB_finalPleth_page-0001](https://user-images.githubusercontent.com/115576548/207989887-19a53512-f01e-4517-ac48-d9b779cf6ec6.jpg)

![CYTB_plainPleth_page-0001](https://user-images.githubusercontent.com/115576548/207989916-f4990862-c017-4d12-8c39-02a13abf3c7e.jpg)

For mapping the traits on the tree, the main focus was species apart of the glutinosus group since those are the species that data has been collected for in the lab. Due to that, the Jetz & Pyron (2018) tree was used since it includes most of the glutinosus species. Figure 5-7 shows the three thermal traits mapped onto the tree. CTmax showed a range of 29.9C and 33.2C with the majority of species averaging around 31C. CTmin showed a range of -1.6C to 0.4C with the majority of species averaging around 0C. Tpref had a range of 16.2C to 17.9C with an average of about 17C across the clade (notably Plethodon yonaholsee was the only species to have a Tpref that was higher than the others). 


![CTMax](https://user-images.githubusercontent.com/115576548/207996513-8a165bce-0cdd-4180-9125-c495ed79cd7c.png)

![CTMin](https://user-images.githubusercontent.com/115576548/207996545-b2b91c4d-7532-4502-8daf-5d4a3d8e1eb9.png)

![TPref](https://user-images.githubusercontent.com/115576548/207996566-e3ce643f-ad27-4677-aac3-18c22b1d9dbf.png)


## Discussion

The results from this project showed that there is not a lot of divergence in thermal traits when looking across the glutinosus group. The glutinosus group had the most rapidly diversification rates compared to any of the other complexes. Microhabitat preferences vary among species in the P. glutinosus group: whereas some are found in warmer and wetter areas (P. teyahalee), others prefer relatively drier and cooler areas (P. glutinosus) (Farallo et al., 2020). These microhabitat preferences could be reflected by differences in their physiology to adapt to those environments, although it does not seem to be in their thermal physiology. Another environmental factor that would influence their physiology is their hydric environment. Desiccating is a major challenge for these salamanders as they rely solely on cutaneous respiration. While temperature is a major factor in dessication, it may not be as crucial as water loss rates. Their hydric physiology could allow for partitioning of the local climatic niche [11] that have promoted this group's rapid diversification. 

Out of all of the thermal traits, CTmin proved to be the one that diversified more with Plethodon serratus being the only species that is not in the glutinosus group and also being the only species with a higher CTmin value. This points to the fact that incorporating more data from species across all three groups might show a larger thermal signal than just the glutinousus group alone. 

The results from the inferred phylogenies showed that both the ND2 gene and cyt-b gene were able to construct the structures of the three main clades (cinereus, glutinosus, and wehleri/welleri group). However, there were some inconsistencies with the relationship of  the species within the glutinosus group and the other clades. This was especially true for species with a wide range (Plethodon glutinosus) that could have more distinct subpopulations. Unfortunately, just using one gene is not enough to get at a better resolution for this genus. The application of genomic tools for population genetics and phylogenetics study in salamanders has conspicuously lagged behind other organisms, in part due to salamanders’ notoriously large and variable genomes (Weisrock et al., 2018). What this project has highlighted to me is that using ddRAD sequencing (and other next generation sequencing) can allow for a full resolution of Plethodon phylogenies. In my future work, I hope to incorporate all of the tools I have learned in this class to infer a Plethodon phylogeny using tail tips from salamanders that I have collected physiological data from. Constructing the tree will also provide a protocol for doing delimitation work in numerous species of salamanders.

The biggest difficulty in implementing these analyses was trying to find full sequences for both the ND2 and cytochrome B gene. There were a lot of sequencing that had less than a couple of 100 basepairs and when those were included in the trees it showed dramatically different relationships. Due to that, I was only able to use a third of the sequences that were in NCBI which limited the amount of species I was able to include in the tree. I am hoping having low sequences will be less of a problem since I will be working to get sequences from as many Plethodon species as possible to encompass the whole clade.

It would be interesting to incorporate other members of the Plethodonitdae family including Desmognathus and Eurycea. There have been few molecular studies done for all of the species in these clades and it would be beneficial to have full resolution on the Plethodontidae family. Furthermore, Desmognathus and Eurycea have species that have different life styles (direct vs indirect developers) and live in different microhabitats (terrestrial vs aquatic and semiaquatic) compared to Plethodon. This would line up a great study to see if their thermal, hydric, or metabolic physiology differs across the whole family and if there any patterns that showcase how these traits have evolved. 


## References
Farallo, V. R., Muñoz, M. M., Uyeda, J. C., & Miles, D. B. (2020). Scaling between macro‐to microscale climatic data reveals strong phylogenetic inertia in niche evolution in plethodontid salamanders. Evolution, 74(5), 979-991.

Glor, R. E. (2010). Phylogenetic insights on adaptive radiation. Annual Review of Ecology, Evolution, and Systematics, 41, 251-270.

Highton, R. (1995). Speciation in eastern North American salamanders of the genus Plethodon. Annual Review of Ecology and Systematics, 26(1), 579-600.

Highton, R., Hastings, A. P., Palmer, C., Watts, R., Hass, C. A., Culver, M., & Arnold, S. J. (2012). Concurrent speciation in the eastern woodland salamanders (genus Plethodon): DNA sequences of the complete albumin nuclear and partial mitochondrial 12s genes. Molecular Phylogenetics and Evolution, 6

Jetz, W., & Pyron, R. A. (2018). The interplay of past diversification and evolutionary isolation with present imperilment across the amphibian tree of life. Nature ecology & evolution, 2(5), 850-858.

Kozak, K. H., Weisrock, D. W., & Larson, A. (2006). Rapid lineage accumulation in a non-adaptive radiation: phylogenetic analysis of diversification rates in eastern North American woodland salamanders (Plethodontidae: Plethodon). Proceedings of the Royal Society B: Biological Sciences, 273(1586), 539-546.

Marvin, G. A. (1996). Life history and population characteristics of the salamander Plethodon kentucki with a review of Plethodon life histories. American Midland Naturalist, 385-400.

Vieites, D. R., Román, S. N., Wake, M. H., & Wake, D. B. (2011). A multigenic perspective on phylogenetic relationships in the largest family of salamanders, the Plethodontidae. Molecular Phylogenetics and Evolution, 59(3), 623-635.

Weisrock, D. W., Hime, P. M., Nunziata, S. O., Jones, K. S., Murphy, M. O., Hotaling, S., & Kratovil, J. D. (2018). Surmounting the large-genome “problem” for genomic data generation in salamanders. In Population genomics: wildlife (pp. 115-142). Springer, Cham.

