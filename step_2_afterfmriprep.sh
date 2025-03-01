#!/bin/bash

pedsid="mim700" # Leave the quotation marks :)

for subj in 680; do

dir=../fmriprep_outputs/sub-${subj}/ses-01/func

# Step 1: Moving the files out of your home directory

mv /home/$pedsid@pediatrics.wisc.edu/sub-${subj}* /mnt/DOP-Restricted_Share/B3_Moreno-Selkie-Cascio_2022-1280/B3_Project_2_Cascio/B3/fmriprep_outputs/

# Step 2: Checking data quality
# You'll just need to do this after the script finishes :)

# Step 3: Trimming, smoothing, and scaling

cd ../fmriprep_outputs/sub-${subj}/ses-01/func

   for run in 01 02; do

     for task in conformity cyberball peerfeedback selfother; do
     #Remove first 7 TRs to achieve steady-state
     3dTcat -prefix sub-${subj}_ses-01_task-${task}_run-${run}_trimmed_bold.nii \
     sub-${subj}_ses-01_task-${task}_run-${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz'[7..$]'

     #Apply 4mm gaussian blur kernel <NUMBER MAY NOT BE OPTIMAL>
     3dmerge -1blur_fwhm 4.0 -doall -prefix sub-${subj}_ses-01_task-${task}_run-${run}_blur.nii \
     sub-${subj}_ses-01_task-${task}_run-${run}_trimmed_bold.nii

     #Scale values to represent percent signal change
     3dTstat -prefix sub-${subj}_ses-01_task-${task}_run-${run}_mean.nii \
     sub-${subj}_ses-01_task-${task}_run-${run}_blur.nii

     3dcalc -a sub-${subj}_ses-01_task-${task}_run-${run}_blur.nii -b sub-${subj}_ses-01_task-${task}_run-${run}_mean.nii \
     -c sub-${subj}_ses-01_task-${task}_run-${run}_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz \
     -expr 'c*min(200,a/b*100)*step(a)*step(b)' \
     -prefix sub-${subj}_ses-01_task-${task}_run-${run}_scale.nii

     done
   done

cd ../../../../scripts

# Step 4: Pulling and formatting motion confounds

        for task in conformity cyberball peerfeedback selfother;do
                rm $dir/*zeros_tmp.txt
                NT1=`3dinfo -nt $dir/sub-${subj}_ses-01_task-${task}_run-01_scale.nii`
                NT2=`3dinfo -nt $dir/sub-${subj}_ses-01_task-${task}_run-02_scale.nii`
                for ((i=0; i<$NT1; i++)); do
                        echo 0 >> $dir/r1_zeros_tmp.txt;
                done
                for ((i=0; i<$NT2; i++)); do
                        echo 0 >> $dir/r2_zeros_tmp.txt;
                done
                for reg in trans_x trans_y trans_z rot_x rot_y rot_z; do
                        for run in 01 02; do
                                awk -v col=$reg 'NR==1{for(i=1;i<=NF;i++){if($i==col){c=i;break}} print $c} NR>1{print $c}' \
                                $dir/sub-${subj}_ses-01_task-${task}_run-${run}_desc-confounds_timeseries.tsv > $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_all_tmp.txt
                                sed '1d' $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_all_tmp.txt > $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_noHead_tmp.txt
                                sed '1!d' $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_all_tmp.txt > $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_Head_tmp.txt
                                tail -n +8 $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_noHead_tmp.txt > temp.txt && mv temp.txt $dir/sub-${subj}_ses-01_task-${task}_run-${run}_${reg}_noHead_tmp.txt
                        done
                        cat $dir/sub-${subj}_ses-01_task-${task}_run-01_${reg}_noHead_tmp.txt $dir/r2_zeros_tmp.txt  > $dir/sub-${subj}_ses-01_task-${task}_run-01_${reg}.txt
                        cat $dir/r1_zeros_tmp.txt $dir/sub-${subj}_ses-01_task-${task}_run-02_${reg}_noHead_tmp.txt > $dir/sub-${subj}_ses-01_task-${task}_run-02_${reg}.txt

                done
        done

   cd ../fmriprep_outputs/sub-${subj}/ses-01/func
    for reg in trans_x trans_y trans_z rot_x rot_y rot_z; do
      for run in 01 02; do
        awk -v cold=$reg 'NR==1{for(i=1;1<=NF;i++){if($i==col){c=1;break}} print $c} NO >1{print $c}' \
        sub-${subj}_ses-01_task-selfother_run-${run}_desc-confounds_timeseries.tsv > ${reg}_run${run}_all_tmp.txt;
          sed '1d' ${reg}_run${run}_all_tmp.txt > ${reg}_run${run}_noHead_tmp.txt
          sed '1!d' ${reg}_run${run}_all_tmp.txt > ${reg}_run${run}_Head_tmp.txt

done
done
   cd ../../../../scripts
done
