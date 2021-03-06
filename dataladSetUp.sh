#!/usr/bin/env bash

root_dir=${PWD}
raw_dir=${root_dir}/inputs/raw
derivatives_dir=${root_dir}/outputs/derivatives
preproc_dir=${derivatives_dir}/cpp_spm-preproc
laynii_dir=${derivatives_dir}/laynii
freesurfer_dir=${derivatives_dir}/freesurfer

# get url of the gin repos from config
source dataladConfig.sh

# install raw dataset
datalad install -d . -s "${URL_RAW}" "${raw_dir}"

# create the derivatives universe of classic sub-subdatasets ()
# . outputs
# └── derivatives
#     ├── cpp_spm-preproc
#     └── cpp_spm-stats

datalad create -d . "${derivatives_dir}"

if [ ! -z "${URL_DER}" ]; then
    cd "${derivatives_dir}"
    datalad siblings add --name origin --url "${URL_DER}"
    cd "${root_dir}"
    datalad subdatasets --set-property url "${URL_DER}" "${derivatives_dir}"
fi

datalad create -d . "${preproc_dir}"

if [ ! -z "${URL_DER_PREPROC}" ]; then
    cd "${preproc_dir}"
    datalad siblings add --name origin --url "${URL_DER_PREPROC}"
    cd ..
    datalad subdatasets --set-property url "${URL_DER_PREPROC}" cpp_spm-preproc
    cd "${root_dir}"
fi

datalad create -d . "${laynii_dir}"

if [ ! -z "${URL_DER_LAYNII}" ]; then
    cd "${laynii_dir}"
    datalad siblings add --name origin --url "${URL_DER_LAYNII}"
    cd ..
    datalad subdatasets --set-property url "${URL_DER_LAYNII}" laynii
    cd "${root_dir}"
fi

datalad create -d . "${freesurfer_dir}"

if [ ! -z "${URL_DER_STATS}" ]; then
    cd "${freesurfer_dir}"
    datalad siblings add --name origin --url "${URL_DER_FREESURFER}"
    cd ..
    datalad subdatasets --set-property url "${URL_DER_FREESURFER}" freesurfer
    cd "${root_dir}"
fi

if [ "${USE_CPP_SPM_DEV}" = true ]; then
    cd code/lib/CPP_SPM
    git checkout origin/dev
    git switch -c dev
    git submodule update --init --recursive && git submodule update --recursive
    cd "${root_dir}"
    datalad save -m 'switch CPP SPM to dev branch'
fi

datalad push --to origin -r

echo "############################"
echo "# DATALAD IS READY TO WORK #"
echo "############################"
