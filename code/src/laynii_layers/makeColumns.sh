#!/usr/bin/env bash

export LAYNII=/home/marcobar/Data/tools/laynii

# export laynii_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/laynii/sub-$subjLabel/ses-001/layers

export laynii_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/laynii/temp

subjLabel='pilot005'

nb_layers=3

$LAYNII/LN2_LAYERS \
    -rim ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_desc-freesurferaseg_label-MTw_rim.nii \
    -nr_layers $nb_layers \
    -equivol \
    -output ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_label-${nb_layers}layersMTw_mask.nii

$LAYNII/LN2_LAYERS \
    -rim ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_desc-freesurferaseg_label-PTw_rim.nii \
    -nr_layers $nb_layers \
    -equivol \
    -output ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_label-${nb_layers}layersPTw_mask.nii

nb_layers=6

$LAYNII/LN2_LAYERS \
    -rim ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_desc-freesurferaseg_label-MTw_rim.nii \
    -nr_layers $nb_layers \
    -equivol \
    -output ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_label-${nb_layers}layersMTw_mask.nii

$LAYNII/LN2_LAYERS \
    -rim ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_desc-freesurferaseg_label-PTw_rim.nii \
    -nr_layers $nb_layers \
    -equivol \
    -output ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-EPIT1w_label-${nb_layers}layersPTw_mask.nii

