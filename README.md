# library_ds_vs_ss

## Comparing the performance of double-stranded and single-stranded DNA libraries for ancient oral microbiome reconstruction

### Introduction
DNA library construction methods can affect the recovery of ancient DNA, thus influencing downstream analyses. While single-stranded library preparation (ssLib) has been shown to outperform double-stranded (dsLib) for highly degraded vertebrate host DNA, especially for samples older than 40,000 years, few studies have examined how library protocols shape ancient microbial community reconstruction. Here, we compare the sequencing output of paired ssLib and dsLib dental calculus libraries generated from twelve Neanderthals and two Chalcolithic humans, prepared using implementations of the Gansauge et al. (2017, 2020) and Meyer and Kircher (2010) protocols, respectively, and sequenced with identical Illumina chemistry. We compared read length and GC%, read duplication, and taxonomic profiles across normalization strategies to assess protocol-specific biases.

dsLib protocols:

- Library construction: Franziska Aron, Gunnar U Neumann, Christina Warinner, Guido Brandt 2020. Non-UDG treated double-stranded DNA library preparation for Illumina sequencing of ancient dental calculus . protocols.io
https://dx.doi.org/10.17504/protocols.io.bqcsmswe
- Indexing: Raphaela Stahl, Christina Warinner, Irina Velsko, Eleftheria Orfanou, Franziska Aron, Guido Brandt 2023. Illumina double-stranded DNA dual indexing for ancient DNA. protocols.io
https://dx.doi.org/10.17504/protocols.io.4r3l287x3l1y/v3
Version created by James A Fellows Yates
  
ssLib protocols:

- Library construction: Sarah Nagel, Anna Schmidt, Ayinuer Aximu Petri, Anya Patova, Merlin Szymanski, Elena Essel, Matthias Meyer 2026. Bravo workstation: automated single-stranded DNA library preparation (ssDNA2.0). protocols.io
https://dx.doi.org/10.17504/protocols.io.kqdg32bdpv25/v2
Version created by Ancient DNA Core Unit
- Indexing: Sarah Nagel, Ayinuer Aximu Petri, Merlin Szymanski, Elena Essel, Matthias Meyer 2025. Bravo workstation: automated indexing, purification and quantification of DNA libraries. protocols.io
https://dx.doi.org/10.17504/protocols.io.q26g71w48gwz/v1

### Authors
Keri Burge, Irina M. Velsko, Domingo Salazar-Garcia, María Haber Uriarte, Joaquín Lomba Maurandi, & Christina Warinner

### Overview
Folders:
- `00-documentation`: Documentation and metadata tables for samples
- `02-scripts`: Workflows and scripts 
- `05-results`: Results generated in the project
- `06-publication`: Main and supplemental figures

### References

Gansauge, M.-T., Gerber, T., Glocke, I., Korlevic, P., Lippik, L., Nagel, S., Riehl, L. M., Schmidt, A., & Meyer, M. (2017). Single-stranded DNA library preparation from highly degraded DNA using T4 DNA ligase. Nucleic Acids Research, 45(10), e79.

Gansauge, M.-T., Aximu-Petri, A., Nagel, S., & Meyer, M. (2020). Manual and automated preparation of single-stranded DNA libraries for the sequencing of DNA from ancient biological remains and other sources of highly degraded DNA. Nature Protocols, 15(8), 2279–2300.

Meyer, M., & Kircher, M. (2010). Illumina sequencing library preparation for highly multiplexed target capture and sequencing. Cold Spring Harbor Protocols, 2010(6), db.prot5448.
