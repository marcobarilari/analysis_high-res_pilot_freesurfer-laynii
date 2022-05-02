#!/usr/bin/env bash

subjLabel='pilot005'

export LAYNII=Data/tools/laynii

export laynii_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/laynii/sub-$subjLabel/ses-001/layers

$LAYNII/LN2_LAYERS -rim ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-individual_label-aseg_freesurferseg_rim.nii -nr_layers 6 -equivol