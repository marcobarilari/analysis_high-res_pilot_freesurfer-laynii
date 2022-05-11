# Source code

In this repo we get layers from the MP2RAGE upsampled to 0.375 mm iso

Steps:

1. Get bias field corrected image from SPM segmentation output
2. Run Freesurfer recon-all for high-res data
3. Get layers with LAYNII
## 1. Get bias field corrected image from SPM segmentation output

Code in `spm_segmentation` folder, this uses `cpp_spm` pipeline

run with 
```matlab
    opt.segment.biasfwhm = 18;
    opt.segment.samplingDistance = 2;
```

as explained [here](https://surfer.nmr.mgh.harvard.edu/fswiki/HighFieldRecon)
## 2. Run Freesurfer recon-all for high-res data

TODO:
- [ ] `importData.py` to copy the the bias corrected images into `outputs/derivatives/freesurfer` (or not? at the moment we are reading the "input" file directly from cpp_spm folder)
- [ ] Implement parallelization. At the moment, I run in separte sreens each subj in parallel, it is like runiing the analyses in different terminals

Code in `freesurfer_recon-all`, run on the monster and it takes ~2 days (*"Don't try this at home"*).

### Results report

- sub-pilot001:

it worked with no bias corrected image 

- sub-pilot004:

run with bias field correction as reported above but (from `recon-all.log`)

```
Left_Putamen too bright - rescaling by 0.984 (from 1.015) to 95.9 (was 97.4)
saving intensity scales to aseg.auto_noCCseg.label_intensities.txt
saving sequentially combined intensity scales to aseg.auto_noCCseg.label_intensities.txt
@#@FSTIME  2022:04:29:05:37:49 mri_ca_label N 10 e 48169.76 S 51.59 U 51934.85 P 107% M 16574836 F 71685 R 29295810 W 0 c 43517 w 75501 I 671792 O 24 L 8.27 8.78 9.15
@#@FSLOADPOST 2022:04:29:19:00:39 mri_ca_label N 10 15.53 14.11 10.32
Linux 1075.psp.ucl.ac.be 3.10.0-1160.59.1.el7.x86_64 #1 SMP Wed Feb 23 16:47:03 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

recon-all -s anatParallel exited with ERRORS at Fri Apr 29 19:00:39 CEST 2022

To report a problem, see http://surfer.nmr.mgh.harvard.edu/fswiki/BugReporting

```

run previously with bias field correction at `biasfwhm = 30` and `samp = 3` and worked. 

-> for the sake of time, taking the results from https://gin.g-node.org/marcobarilari/sandbox_MP2RAGE-layers_derivatives-freesurfer.git

- sub-pilot005:

It worked fine, manual editing is needed

## 3. Get layers with LAYNII

TODO:
- [ ] better automation across subjs

Code in `laynii_layers`.

1. Convert `*/mri/aseg.mgz` outputs into nii files and save in save in`derivatives/laynii/sub-*/ses-*` subj by subj via `convertAseg.sh`, run locally

2. "rimmify" freesurfer `mri/aseg.mgz` output to have 3 valuse according to LAYNII requirments. Code by Faruk Gulban, add in the script the file path, run locally

3. Make layers subj by subj via `makeLayers.sh`, run on the monster.