# Source code

In this repo we get layers from the MP2RAGE upsampled to 0.375 mm iso

Steps:

1. Get bias field corrected image from SPM segmentation output
2. Run Freesurfer recon-all for high-res data
3. Get layers with LAYNII
## Get bias field corrected image from SPM segmentation output

Code in `spm_segmentation` folder, this uses `cpp_spm` pipeline

run with 
```matlab
    opt.segment.biasfwhm = 18;
    opt.segment.samplingDistance = 2;
```

as explained [here](https://surfer.nmr.mgh.harvard.edu/fswiki/HighFieldRecon)
## Run Freesurfer recon-all for high-res data

TODO:
- [ ] `importData.py` to copy the the bias corrected images into `outputs/derivatives/freesurfer`
- [ ] implement parallelization

At the moment, I run in separte sreens each subj in parallel, it is like runiing the analyses in different terminals


