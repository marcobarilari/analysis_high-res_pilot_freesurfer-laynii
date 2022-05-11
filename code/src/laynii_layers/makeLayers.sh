#!/usr/bin/env bash

subjLabel='pilot004'

nb_layers=12

export LAYNII=/home/marcobar/Data/tools/laynii

export laynii_dir=/home/marcobar/Data/analysis_high-res_pilot_freesurfer-laynii/outputs/derivatives/laynii/sub-$subjLabel/ses-001/layers



$LAYNII/LN2_LAYERS \
    -rim ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-individual_label-aseg_freesurferseg_rim.nii \
    -nr_layers $nb_layers \
    -equivol \
    -output ${laynii_dir}/sub-${subjLabel}_ses-001_acq-r0p375_space-individual_label-${nb_layers}layer_mask.nii