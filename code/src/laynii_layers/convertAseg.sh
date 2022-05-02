#!/usr/bin/env bash

subjLabel='pilot004'

# # for the monster
# export FREESURFER_HOME=/usr/local/freesurfer/7.2.0-1

# source $FREESURFER_HOME/SetUpFreeSurfer.sh

# export SUBJECTS_DIR=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/freesurfer/sub-$subjLabel/ses-001/anat

# export laynii_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/laynii/sub-$subjLabel/ses-001/layers

# local run

source $FREESURFER_HOME/SetUpFreeSurfer.sh

export SUBJECTS_DIR=/Users/barilari/data/V5_high-res_pilot001_analyses/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/freesurfer/sub-$subjLabel/ses-001/anat

export laynii_dir=/Users/barilari/data/V5_high-res_pilot001_analyses/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/laynii/sub-$subjLabel/ses-001/layers

mri_convert $SUBJECTS_DIR/mri/aseg.mgz $laynii_dir/sub-${subjLabel}_ses-001_acq-r0p375_space-individual_label-aseg_freesurferseg.nii