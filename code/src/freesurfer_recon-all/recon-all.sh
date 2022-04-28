#!/usr/bin/env bash

subjLabel='pilot001'

export FREESURFER_HOME=/usr/local/freesurfer/7.2.0-1

source $FREESURFER_HOME/SetUpFreeSurfer.sh

export SUBJECTS_DIR=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/freesurfer/freesurfer/sub-$subjLabel/ses-001/anat

export data_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/cpp_spm-preproc/sub-$subjLabel/ses-001/anat

export code_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/code/src/freesurfer_recon-all

export output_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/freesurfer/sub-$subjLabel/ses-001/anat

# with parallel flag

recon-all -all \
    -s $data_dir/anatParallel -hires \
    -i $data_dir/$subjLabel_ses-001_acq-r0p375_space-individual_desc-biascor_UNIT1.nii \
    -expert $code_dir/expert.opts \
    -parallel -openmp 10
