#!/bin/bash

for subj in `cat subjList.txt` ; do

file1="../timings/${subj}a_peerfeedback_bad.txt"
file2="../timings/${subj}ab_peerfeedback_bad.txt"

if [ -e "${file1}" ]; then
# All self-other timing files for two runs
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_other.txt" "../timings/${subj}b_selfother_other.txt" -write_timing "../timings/tworun1D/${subj}.selfother_other.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_self.txt" "../timings/${subj}b_selfother_self.txt" -write_timing "../timings/tworun1D/${subj}.selfother_self.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_like.txt" "../timings/${subj}b_selfother_like.txt" -write_timing "../timings/tworun1D/${subj}.selfother_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_dislike.txt" "../timings/${subj}b_selfother_dislike.txt" -write_timing "../timings/tworun1D/${subj}.selfother_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_selflike.txt" "../timings/${subj}b_selfother_selflike.txt" -write_timing "../timings/tworun1D/${subj}.selfother_selflike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_selfdislike.txt" "../timings/${subj}b_selfother_selfdislike.txt" -write_timing "../timings/tworun1D/${subj}.selfother_selfdislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_otherlike.txt" "../timings/${subj}b_selfother_otherlike.txt" -write_timing "../timings/tworun1D/${subj}.selfother_otherlike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_otherdislike.txt" "../timings/${subj}b_selfother_otherdislike.txt" -write_timing "../timings/tworun1D/${subj}.selfother_otherdislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_certain.txt" "../timings/${subj}b_selfother_certain.txt" -write_timing "../timings/tworun1D/${subj}.selfother_certain.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_uncertain.txt" "../timings/${subj}b_selfother_uncertain.txt" -write_timing "../timings/tworun1D/${subj}.selfother_uncertain.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_fixation.txt" "../timings/${subj}b_selfother_fixation.txt" -write_timing "../timings/tworun1D/${subj}.selfother_fixation.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_rating_pmod.txt" "../timings/${subj}b_selfother_rating_pmod.txt" -write_timing "../timings/tworun1D/${subj}.selfother_rating_pmod.1D" 
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_certainty_pmod.txt" "../timings/${subj}b_selfother_certainty_pmod.txt"  -write_timing "../timings/tworun1D/${subj}.selfother_certainty_pmod.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_rating_pmod_inv.txt" "../timings/${subj}b_selfother_rating_pmod_inv.txt" -write_timing "../timings/tworun1D/${subj}_selfother_rating_pmod_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_rating_pmod_exp.txt" "../timings/${subj}b_selfother_rating_pmod_exp.txt" -write_timing "../timings/tworun1D/${subj}_selfother_rating_pmod_exp.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_selfother_rating_pmod_exp_inv.txt" "../timings/${subj}b_selfother_rating_pmod_exp_inv.txt" -write_timing "../timings/tworun1D/${subj}_selfother_rating_pmod_exp_inv.1D" -timing_to_1D_mods

# All peer feedback timing files for two runs

 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_bad.txt" "../timings/${subj}b_peerfeedback_bad.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_bad.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_fixation.txt" "../timings/${subj}b_peerfeedback_fixation.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_fixation.1D" 
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_good.txt" "../timings/${subj}b_peerfeedback_good.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_good.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_green_dislike.txt" "../timings/${subj}b_peerfeedback_green_dislike.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_green_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_green_like.txt" "../timings/${subj}b_peerfeedback_green_like.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_green_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_green.txt" "../timings/${subj}b_peerfeedback_green.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_green.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_orange_dislike.txt" "../timings/${subj}b_peerfeedback_orange_dislike.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_orange_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_orange_like.txt" "../timings/${subj}b_peerfeedback_orange_like.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_orange_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_orange.txt" "../timings/${subj}b_peerfeedback_orange.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_orange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_peer_dislike.txt" "../timings/${subj}b_peerfeedback_peer_dislike.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_peer_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_peer_like.txt" "../timings/${subj}b_peerfeedback_peer_like.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_peer_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_yellow_dislike.txt" "../timings/${subj}b_peerfeedback_yellow_dislike.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_yellow_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_yellow_like.txt" "../timings/${subj}b_peerfeedback_yellow_like.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_yellow_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_yellow.txt" "../timings/${subj}b_peerfeedback_yellow.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_yellow.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feedback_pmod.txt" "../timings/${subj}b_peerfeedback_feedback_pmod.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_feedback_pmod.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feeling_pmod.txt" "../timings/${subj}b_peerfeedback_feeling_pmod.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_feeling_pmod.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feedback_pmod_inv.txt" "../timings/${subj}b_peerfeedback_feedback_pmod_inv.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_feedback_pmod_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feeling_pmod_inv.txt" "../timings/${subj}b_peerfeedback_feeling_pmod_inv.txt"  -write_timing "../timings/tworun1D/${subj}.peerfeedback_feeling_pmod_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feedback_pmod_exp.txt" "../timings/${subj}b_peerfeedback_feedback_pmod_exp.txt"  -write_timing "../timings/tworun1D/${subj}.peerfeedback_feedback_pmod_exp.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feeling_pmod_exp.txt" "../timings/${subj}b_peerfeedback_feeling_pmod_exp.txt"  -write_timing "../timings/tworun1D/${subj}.peerfeedback_feeling_pmod_exp.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feedback_pmod_exp_inv.txt" "../timings/${subj}b_peerfeedback_feedback_pmod_exp_inv.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_feedback_pmod_exp_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}a_peerfeedback_feeling_pmod_exp_inv.txt" "../timings/${subj}a_peerfeedback_feeling_pmod_exp_inv.txt" -write_timing "../timings/tworun1D/${subj}.peerfeedback_feeling_pmod_exp_inv.1D" -timing_to_1D_mods

# All conformity timing files for two runs

 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_same.txt" "../timings/${subj}b_conformity_same.txt" -write_timing "../timings/tworun1D/${subj}.conformity_same.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_lower.txt" "../timings/${subj}b_conformity_lower.txt" -write_timing "../timings/tworun1D/${subj}.conformity_lower.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_higher.txt" "../timings/${subj}b_conformity_higher.txt" -write_timing "../timings/tworun1D/${subj}.conformity_higher.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_misaligned.txt"  "../timings/${subj}b_conformity_misaligned.txt" -write_timing "../timings/tworun1D/${subj}.conformity_misaligned.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_change.txt" "../timings/${subj}b_conformity_change.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_nochange.txt" "../timings/${subj}b_conformity_nochange.txt" -write_timing "../timings/tworun1D/${subj}.conformity_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_same_change.txt" "../timings/${subj}b_conformity_same_change.txt" -write_timing "../timings/tworun1D/${subj}.conformity_same_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_same_nochange.txt" "../timings/${subj}b_conformity_same_nochange.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_same_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_lower_change.txt" "../timings/${subj}b_conformity_lower_change.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_lower_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_lower_nochange.txt" "../timings/${subj}b_conformity_lower_nochange.txt" -write_timing "../timings/tworun1D/${subj}.conformity_lower_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_higher_change.txt" "../timings/${subj}b_conformity_higher_change.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_higher_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_higher_nochange.txt" "../timings/${subj}b_conformity_higher_nochange.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_higher_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_like_change.txt" "../timings/${subj}b_conformity_like_change.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_like_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_like_nochange.txt" "../timings/${subj}b_conformity_like_nochange.txt" -write_timing "../timings/tworun1D/${subj}.conformity_like_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_dislike_change.txt" "../timings/${subj}b_conformity_dislike_change.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_dislike_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_dislike_nochange.txt" "../timings/${subj}b_conformity_dislike_nochange.txt" -write_timing "../timings/tworun1D/${subj}.conformity_dislike_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_certain_change.txt" "../timings/${subj}b_conformity_certain_change.txt" -write_timing "../timings/tworun1D/${subj}.conformity_certain_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_certain_nochange.txt" "../timings/${subj}b_conformity_certain_nochange.txt"  -write_timing "../timings/tworun1D/${subj}.conformity_certain_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_uncertain_change.txt" "../timings/${subj}b_conformity_uncertain_change.txt" -write_timing "../timings/tworun1D/${subj}.conformity_uncertain_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_uncertain_nochange.txt" "../timings/${subj}b_conformity_uncertain_nochange.txt" -write_timing "../timings/tworun1D/${subj}.conformity_uncertain_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}a_conformity_fixation.txt" "../timings/${subj}b_conformity_fixation.txt" -write_timing "../timings/tworun1D/${subj}.conformity_fixation.1D"

else
echo ${subj} " is not a two-run participant"

fi
if [ -e "${file2}" ]; then

# All self-other files for one run

 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_other.txt" -write_timing "../timings/onerun1D/${subj}.selfother_other.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_self.txt" -write_timing "../timings/onerun1D/${subj}.selfother_self.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_like.txt" -write_timing "../timings/onerun1D/${subj}.selfother_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_dislike.txt" -write_timing "../timings/onerun1D/${subj}.selfother_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_selflike.txt" -write_timing "../timings/onerun1D/${subj}.selfother_selflike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_selfdislike.txt" -write_timing "../timings/onerun1D/${subj}.selfother_selfdislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_otherlike.txt"  -write_timing "../timings/onerun1D/${subj}.selfother_otherlike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_otherdislike.txt"  -write_timing "../timings/onerun1D/${subj}.selfother_otherdislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_certain.txt" -write_timing "../timings/onerun1D/${subj}.selfother_certain.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_uncertain.txt" -write_timing "../timings/onerun1D/${subj}.selfother_uncertain.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_fixation.txt" -write_timing "../timings/onerun1D/${subj}.selfother_fixation.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_rating_pmod.txt" -write_timing "../timings/onerun1D/${subj}.selfother_rating_pmod.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_rating_pmod_inv.txt" -write_timing "../timings/onerun1D/${subj}.selfother_rating_pmod_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_rating_pmod_exp.txt" -write_timing "../timings/onerun1D/${subj}.selfother_rating_pmod_exp.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_selfother_rating_pmod_exp_inv.txt" -write_timing "../timings/onerun1D/${subj}.selfother_rating_pmod_exp_inv.1D" -timing_to_1D_mods


# All peer feedback files for one run

 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_bad.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_bad.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_fixation.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_fixation.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_good.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_good.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_green_dislike.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_green_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_green_like.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_green_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_green.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_green.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_orange_dislike.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_orange_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_orange_like.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_orange_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_orange.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_orange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_peer_dislike.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_peer_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_peer_like.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_peer_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_yellow_dislike.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_yellow_dislike.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_yellow_like.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_yellow_like.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_yellow.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_yellow.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feedback_pmod.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_feedback_pmod.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feeling_pmod.txt"  -write_timing "../timings/onerun1D/${subj}.peerfeedback_feeling_pmod.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feedback_pmod_inv.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_feedback_pmod_inv.1D"-timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feeling_pmod_inv.txt"  -write_timing "../timings/onerun1D/${subj}.peerfeedback_feeling_pmod_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feedback_pmod_exp.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_feedback_pmod_exp.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feeling_pmod_exp.txt"  -write_timing "../timings/onerun1D/${subj}.peerfeedback_feeling_pmod_exp.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feedback_pmod_exp_inv.txt" -write_timing "../timings/onerun1D/${subj}.peerfeedback_feedback_pmod_exp_inv.1D" -timing_to_1D_mods
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_peerfeedback_feeling_pmod_exp_inv.txt"  -write_timing "../timings/onerun1D/${subj}.peerfeedback_feeling_pmod_exp_inv.1D" -timing_to_1D_mods


# All conformity files for one run 

 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_same.txt" -write_timing "../timings/onerun1D/${subj}.conformity_same.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_lower.txt" -write_timing "../timings/onerun1D/${subj}.conformity_lower.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_higher.txt" -write_timing "../timings/onerun1D/${subj}.conformity_higher.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_misaligned.txt" -write_timing "../timings/onerun1D/${subj}.conformity_misaligned.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_same_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_same_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_same_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_same_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_lower_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_lower_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_lower_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_lower_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_higher_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_higher_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_higher_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_higher_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_like_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_like_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_like_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_like_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_dislike_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_dislike_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_dislike_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_dislike_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_certain_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_certain_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_certain_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_certain_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_uncertain_change.txt" -write_timing "../timings/onerun1D/${subj}.conformity_uncertain_change.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_uncertain_nochange.txt" -write_timing "../timings/onerun1D/${subj}.conformity_uncertain_nochange.1D"
 timing_tool.py -fsl_timing_files "../timings/${subj}ab_conformity_fixation.txt" -write_timing "../timings/onerun1D/${subj}.conformity_fixation.1D"

else
echo ${subj} " is not a one-run participant"

fi

done



