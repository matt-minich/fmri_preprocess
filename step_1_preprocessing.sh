#!/bin/bash

pedsid="mim700"

for subj in 732; do 

# Step 1: Copying files

mkdir -p ../BIDS_data/sub-${subj}/ses-01/anat ../BIDS_data/sub-${subj}/ses-01/func
cp ../mri/${subj}/dicoms/00006.task_Self_Other/00006.task_Self_Other.tgz ../BIDS_data/sub-${subj}/ses-01/func/1_Self_Other.tgz
cp ../mri/${subj}/dicoms/00007.task_Self_Other/00007.task_Self_Other.tgz ../BIDS_data/sub-${subj}/ses-01/func/2_Self_Other.tgz
cp ../mri/${subj}/dicoms/00008.task_Peer_Feedback/00008.task_Peer_Feedback.tgz ../BIDS_data/sub-${subj}/ses-01/func/1_Peer_Feedback.tgz
cp ../mri/${subj}/dicoms/00009.task_Peer_Feedback/00009.task_Peer_Feedback.tgz ../BIDS_data/sub-${subj}/ses-01/func/2_Peer_Feedback.tgz
cp ../mri/${subj}/dicoms/00010.task_Conformity/00010.task_Conformity.tgz ../BIDS_data/sub-${subj}/ses-01/func/1_Conformity.tgz
cp ../mri/${subj}/dicoms/00011.task_Conformity/00011.task_Conformity.tgz ../BIDS_data/sub-${subj}/ses-01/func/2_Conformity.tgz
cp ../mri/${subj}/dicoms/00012.task_Cyberball/00012.task_Cyberball.tgz ../BIDS_data/sub-${subj}/ses-01/func/1_Cyberball.tgz
cp ../mri/${subj}/dicoms/00002.3D_Sag_MPRAGE/00002.3D_Sag_MPRAGE.tgz ../BIDS_data/sub-${subj}/ses-01/anat/1_Anat.tgz

# Step 2: Converting files to BIDS format 

cd ../BIDS_data/sub-${subj}/ses-01/func

tempdir=$(mktemp -d)
tar -zxvf 1_Self_Other.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-selfother_run-01_bold.nii
mv tmp*json sub-${subj}_ses-01_task-selfother_run-01_bold.json

tempdir=$(mktemp -d)
tar -zxvf 2_Self_Other.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-selfother_run-02_bold.nii
mv tmp*json sub-${subj}_ses-01_task-selfother_run-02_bold.json

tempdir=$(mktemp -d)
tar -zxvf 1_Peer_Feedback.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-peerfeedback_run-01_bold.nii
mv tmp*json sub-${subj}_ses-01_task-peerfeedback_run-01_bold.json

tempdir=$(mktemp -d)
tar -zxvf 2_Peer_Feedback.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-peerfeedback_run-02_bold.nii
mv tmp*json sub-${subj}_ses-01_task-peerfeedback_run-02_bold.json

tempdir=$(mktemp -d)
tar -zxvf 1_Conformity.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-conformity_run-01_bold.nii
mv tmp*json sub-${subj}_ses-01_task-conformity_run-01_bold.json

tempdir=$(mktemp -d)
tar -zxvf 2_Conformity.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-conformity_run-02_bold.nii
mv tmp*json sub-${subj}_ses-01_task-conformity_run-02_bold.json

tempdir=$(mktemp -d)
tar -zxvf 1_CyberBall.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_task-cyberball_run-01_bold.nii
mv tmp*json sub-${subj}_ses-01_task-cyberball_run-01_bold.json

rm -f *tgz

cd ../anat

tempdir=$(mktemp -d)
tar -zxvf 1_Anat.tgz -C "$tempdir"
dcm2niix_afni -o . "$tempdir"
rm -r "$tempdir"
mv tmp*nii sub-${subj}_ses-01_T1w.nii
mv tmp*json sub-${subj}_ses-01_T1w.json

rm -f *tgz
cd ../../../../scripts

# Step 3: Copying the data to your staging area

cp -r ../BIDS_data/sub-${subj} ../staging_areas/$pedsid


# Step 4: Running fMRIprep

fmriprep-docker --fs-license-file ../../Software/license.txt ../staging_areas/$pedsid /home/$pedsid@pediatrics.wisc.edu

done

