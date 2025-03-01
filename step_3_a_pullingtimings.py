#!/usr/bin/env python
import glob
import numpy as np
import os
import pandas as pd

button_keys = {'b':1,'y':2,'g':3,'r':4} # This encodes the button box responses. THERE IS ALWAYS A CHANCE THIS MIGHT BE BACKWARDS.
button_keys_inv = {'b':4,'y':3,'g':2,'r':1}
button_keys_exp = {'b':2.718, 'y':7.389, 'g':20.086, 'r': 58.594} # This encodes the responeses and transforms them for an exponential relationship. b = e^1, r = e^4
button_keys_exp_inv = {'b': 58.594, 'y': 20.086, 'g': 7.389, 'r': 2.718}

def selfother_times(file_path, run_id):
    df = pd.read_csv(file_path)
    other_file = f"../timings/{run_id}_selfother_other.txt"
    self_file = f"../timings/{run_id}_selfother_self.txt"
    like_file = f"../timings/{run_id}_selfother_like.txt"
    dislike_file = f"../timings/{run_id}_selfother_dislike.txt"
    self_like_file = f"../timings/{run_id}_selfother_selflike.txt"
    self_dislike_file = f"../timings/{run_id}_selfother_selfdislike.txt"
    other_like_file = f"../timings/{run_id}_selfother_otherlike.txt"
    other_dislike_file = f"../timings/{run_id}_selfother_otherdislike.txt"
    certain_file = f"../timings/{run_id}_selfother_certain.txt"
    uncertain_file = f"../timings/{run_id}_selfother_uncertain.txt"
    fixation_file = f"../timings/{run_id}_selfother_fixation.txt"
    certainty_pmod_file = f"../timings/{run_id}_selfother_certainty_pmod.txt"
    rating_pmod_file = f"../timings/{run_id}_selfother_rating_pmod.txt"
    rating_pmod_inv_file = f"../timings/{run_id}_selfother_rating_pmod_inv.txt"
    rating_pmod_exp_file = f"../timings/{run_id}_selfother_rating_pmod_exp.txt"
    rating_pmod_exp_inv_file = f"../timings/{run_id}_selfother_rating_pmod_exp_inv.txt"
    if 'sm_directions.stopped' in df.columns:
        value = df.loc[1,'sm_directions.started'] + 7
    elif 'sm_instructions.stopped' in df.columns: 
        value = df.loc[1,'sm_instructions.started'] + 7
    print(f'reading {file_path}')
    with open(fixation_file, 'w')  as file:
        for index, row in df.iloc[1:].iterrows():
                timing = row['fixation_cross.started']-value
                duration = row['fixation_duration']
                file.write(f'{timing} {duration} \n' )
    with open(other_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['type'] == 'peer':
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(self_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['type'] == 'self':
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_rateresp_box.keys'] == 'r' or row['sm_rateresp_box.keys'] == 'g':
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_rateresp_box.keys'] == 'b' or row['sm_rateresp_box.keys'] == 'y':
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(self_like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['type'] == 'self' and (row['sm_rateresp_box.keys'] == 'r' or row['sm_rateresp_box.keys'] == 'g'):
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(self_dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['type'] == 'self' and (row['sm_rateresp_box.keys'] == 'b' or row['sm_rateresp_box.keys'] == 'y'):
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(other_like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['type'] == 'peer' and (row['sm_rateresp_box.keys'] == 'r' or row['sm_rateresp_box.keys'] == 'g'):
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(other_dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['type'] == 'peer' and (row['sm_rateresp_box.keys'] == 'b' or row['sm_rateresp_box.keys'] == 'y'):
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing} \n")
    with open(certain_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
           if row['certainty_box.keys'] == 'r' or row['certainty_box.keys'] == 'g': 
               timing = row['socialmedia_stim.started']-value
               file.write(f"{timing} \n")
    with open(uncertain_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
           if row['certainty_box.keys'] == 'b' or row['certainty_box.keys'] == 'y':
               timing = row['socialmedia_stim.started']-value
               file.write(f"{timing} \n")
    with open(certainty_pmod_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['certainty_box.keys'] in button_keys:
                resp = button_keys.get(row['certainty_box.keys'], None)
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing}  5  {resp} \n")
    with open(rating_pmod_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_rateresp_box.keys'] in button_keys:
                resp = button_keys.get(row['sm_rateresp_box.keys'], None)
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing}  5  {resp} \n")
    with open(rating_pmod_inv_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_rateresp_box.keys'] in button_keys:
                resp = button_keys_inv.get(row['sm_rateresp_box.keys'], None)
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing}  5  {resp} \n")
    with open(rating_pmod_exp_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_rateresp_box.keys'] in button_keys :
                resp = button_keys_exp.get(row['sm_rateresp_box.keys'], None)
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing}  5  {resp} \n")
    with open(rating_pmod_exp_inv_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_rateresp_box.keys'] in button_keys:
                resp = button_keys_exp_inv.get(row['sm_rateresp_box.keys'], None)
                timing = row['socialmedia_stim.started']-value
                file.write(f"{timing}  5  {resp} \n")

def peerfeedback_times(file_path, run_id):
    df = pd.read_csv(file_path)
    green_file = f"../timings/{run_id}_peerfeedback_green.txt"
    yellow_file = f"../timings/{run_id}_peerfeedback_yellow.txt"
    orange_file = f"../timings/{run_id}_peerfeedback_orange.txt"
    peer_like_file = f"../timings/{run_id}_peerfeedback_peer_like.txt"
    peer_dislike_file = f"../timings/{run_id}_peerfeedback_peer_dislike.txt"
    good_file = f"../timings/{run_id}_peerfeedback_good.txt"
    bad_file = f"../timings/{run_id}_peerfeedback_bad.txt"
    green_like_file = f"../timings/{run_id}_peerfeedback_green_like.txt"
    green_dislike_file = f"../timings/{run_id}_peerfeedback_green_dislike.txt"
    yellow_like_file = f"../timings/{run_id}_peerfeedback_yellow_like.txt"
    yellow_dislike_file = f"../timings/{run_id}_peerfeedback_yellow_dislike.txt"
    orange_like_file = f"../timings/{run_id}_peerfeedback_orange_like.txt"
    orange_dislike_file = f"../timings/{run_id}_peerfeedback_orange_dislike.txt"
    fixation_file = f"../timings/{run_id}_peerfeedback_fixation.txt"
    feedback_pmod_file = f"../timings/{run_id}_peerfeedback_feedback_pmod.txt"
    feeling_pmod_file = f"../timings/{run_id}_peerfeedback_feeling_pmod.txt"
    feedback_pmod_inv_file = f"../timings/{run_id}_peerfeedback_feedback_pmod_inv.txt"
    feeling_pmod_inv_file = f"../timings/{run_id}_peerfeedback_feeling_pmod_inv.txt"
    feedback_pmod_exp_file = f"../timings/{run_id}_peerfeedback_feedback_pmod_exp.txt"
    feeling_pmod_exp_file = f"../timings/{run_id}_peerfeedback_feeling_pmod_exp.txt"
    feedback_pmod_exp_inv_file = f"../timings/{run_id}_peerfeedback_feedback_pmod_exp_inv.txt"
    feeling_pmod_exp_inv_file = f"../timings/{run_id}_peerfeedback_feeling_pmod_exp_inv.txt"
    value = df.loc[1,'peerfeedback_directions.started'] + 7
    print(f'reading {file_path}')
    df['peer_stim_rating'] = pd.to_numeric(df['peer_stim_rating'].fillna(0).astype(int))  # This line of code converts the peer stim ratings to integers so they can be used as the power of e later.  
    with open(fixation_file, 'w')  as file:
        for index, row in df.iloc[1:].iterrows():
                timing = row['fixation_cross.started']-value
                duration = row['fixation_duration']
                file.write(f'{timing} {duration} \n' )
    with open(green_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'green':
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(green_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'green':
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(yellow_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'yellow':
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(orange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'orange':
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(peer_like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['peer_stim_rating'] > 2:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(peer_dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['peer_stim_rating'] < 3:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(good_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] == 'g' or row['feeling_rep.keys'] == 'r':
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(bad_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] == 'b' or row['feeling_rep.keys'] == 'y':
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(green_like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'green' and row['peer_stim_rating'] > 2:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(yellow_like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'yellow' and row['peer_stim_rating'] > 2:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(orange_like_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'orange' and row['peer_stim_rating'] > 2:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(green_dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'green' and row['peer_stim_rating'] < 3:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(yellow_dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'yellow' and row['peer_stim_rating'] < 3:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(orange_dislike_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['border_color'] == 'orange' and row['peer_stim_rating'] < 3:
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing} \n")
    with open(feedback_pmod_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = row['peer_stim_rating']
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feeling_pmod_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = button_keys.get(row['feeling_rep.keys'], None)
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feedback_pmod_inv_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = 5 - row['peer_stim_rating']
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feeling_pmod_inv_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = button_keys_inv.get(row['feeling_rep.keys'], None)
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feedback_pmod_exp_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = np.exp(row['peer_stim_rating'])
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feeling_pmod_exp_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = button_keys_exp.get(row['feeling_rep.keys'], None)
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feedback_pmod_exp_inv_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = np.exp(5 - row['peer_stim_rating'])
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")
    with open(feeling_pmod_exp_inv_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['feeling_rep.keys'] in button_keys:
                resp = button_keys_exp_inv.get(row['feeling_rep.keys'], None)
                timing = row['peerfeedback_stimuli.started']-value
                file.write(f"{timing}  8  {resp} \n")



def conformity_times(file_path, run_id, prefix, suffix):
    df = pd.read_csv(file_path)
    # This section of code pulls the Task 1 files and adds a column for certainty
    selfother_search_pattern = f'../logs/selfother_all/{prefix}_task1*.csv'
    selfother_logs = glob.glob(selfother_search_pattern)
    selfother_dfs = [pd.read_csv(file) for file in selfother_logs]
    if len(selfother_dfs) > 1:
         selfother_merged = pd.concat(selfother_dfs, ignore_index = True)
         df = df.merge(selfother_merged[['stimuli_file','certainty_box.keys']], on = 'stimuli_file', how = 'left')
         df = df.iloc[1:].reset_index(drop=True)
    else:
         df = df.merge(selfother_dfs[0][['stimuli_file', 'certainty_box.keys']], on='stimuli_file', how='left')
    # Now back to our regular programming (lol)
    same_file = f"../timings/{run_id}_conformity_same.txt"
    lower_file = f"../timings/{run_id}_conformity_lower.txt"
    higher_file = f"../timings/{run_id}_conformity_higher.txt"
    misaligned_file = f"../timings/{run_id}_conformity_misaligned.txt"
    change_file = f"../timings/{run_id}_conformity_change.txt"
    nochange_file = f"../timings/{run_id}_conformity_nochange.txt"
    same_change_file = f"../timings/{run_id}_conformity_same_change.txt"
    same_nochange_file = f"../timings/{run_id}_conformity_same_nochange.txt"
    lower_change_file = f"../timings/{run_id}_conformity_lower_change.txt"
    lower_nochange_file = f"../timings/{run_id}_conformity_lower_nochange.txt"
    higher_change_file = f"../timings/{run_id}_conformity_higher_change.txt"
    higher_nochange_file = f"../timings/{run_id}_conformity_higher_nochange.txt"
    like_change_file = f"../timings/{run_id}_conformity_like_change.txt"
    like_nochange_file = f"../timings/{run_id}_conformity_like_nochange.txt"
    dislike_change_file = f"../timings/{run_id}_conformity_dislike_change.txt"
    dislike_nochange_file = f"../timings/{run_id}_conformity_dislike_nochange.txt"
    certain_change_file = f"../timings/{run_id}_conformity_certain_change.txt"
    certain_nochange_file = f"../timings/{run_id}_conformity_certain_nochange.txt"
    uncertain_change_file = f"../timings/{run_id}_conformity_uncertain_change.txt"
    uncertain_nochange_file = f"../timings/{run_id}_conformity_uncertain_nochange.txt"
    fixation_file = f"../timings/{run_id}_conformity_fixation.txt"
    value = df.loc[1,'si_directions.started'] + 7
    print(f'reading {file_path}')
    with open(fixation_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
                timing = row['fixation_cross.started']-value
                duration = row['fixation_duration']
                file.write(f'{timing} {duration} \n' )
    with open(same_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['peer_rating'] == 'SAME':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(lower_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['peer_rating'] == 'LOWER':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(higher_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['peer_rating'] == 'LOWER':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(misaligned_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and (row['peer_rating'] == 'LOWER' or row['peer_rating'] == 'HIGHER'):
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] != row['rerate_box.keys']:
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] == row['rerate_box.keys']:
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(same_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] != row['rerate_box.keys'] and row['peer_rating'] == 'SAME':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(same_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] == row['rerate_box.keys'] and row['peer_rating'] == 'SAME':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(lower_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] != row['rerate_box.keys'] and row['peer_rating'] == 'LOWER':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(lower_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] == row['rerate_box.keys'] and row['peer_rating'] == 'LOWER':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(higher_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] != row['rerate_box.keys'] and row['peer_rating'] == 'HIGHER':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(higher_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] != 'None' and row['sm_resp'] == row['rerate_box.keys'] and row['peer_rating'] == 'HIGHER':
                timing = row['peer_rate.started']-value
                file.write(f"{timing} \n")
    with open(like_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys:
                resp = button_keys_inv.get(row['sm_resp'], None)
                if resp > 2 and row['sm_resp'] == row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(like_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys:
                resp = button_keys_inv.get(row['sm_resp'], None)
                if resp > 2 and row['sm_resp'] != row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(dislike_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys:
                resp = button_keys_inv.get(row['sm_resp'], None)
                if resp < 3 and row['sm_resp'] == row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(dislike_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys:
                resp = button_keys_inv.get(row['sm_resp'], None)
                if resp < 3 and row['sm_resp'] != row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(certain_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys and row['certainty_box.keys'] in button_keys:
                resp = button_keys_inv.get(row['certainty_box.keys'], None)
                if resp > 2 and row['sm_resp'] == row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(certain_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys and row['certainty_box.keys'] in button_keys:
                resp = button_keys_inv.get(row['certainty_box.keys'], None)
                if resp > 2 and row['sm_resp'] != row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(uncertain_change_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys and row['certainty_box.keys'] in button_keys:
                resp = button_keys_inv.get(row['certainty_box.keys'], None)
                if resp < 3 and row['sm_resp'] == row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")
    with open(uncertain_nochange_file, 'w') as file:
        for index, row in df.iloc[1:].iterrows():
            if row['sm_resp'] in button_keys and row['certainty_box.keys'] in button_keys:
                resp = button_keys_inv.get(row['certainty_box.keys'], None)
                if resp < 3 and row['sm_resp'] != row['rerate_box.keys']:
                   timing = row['peer_rate.started']-value
                   file.write(f"{timing} \n")

def cyberball_times():
    print("Please code this function :)")

def process_all_csvs(directory,task):
    for filename in os.listdir(directory):
        if filename.endswith('.csv'):
            parts = filename.split('_')
            prefix = parts[0]
            suffix = parts[-1].replace('.csv','')
            file_path = os.path.join(directory, filename)
            run_id = f"{prefix}{suffix}"
            if task == 'self-other':
               selfother_times(file_path, run_id)
            if task == 'feedback':
               peerfeedback_times(file_path, run_id)
            if task == 'conformity':
               conformity_times(file_path, run_id, prefix,suffix)
            if task == 'cyberball':
               cyberball_times()

task = input('What task would you like timings for? (self-other, feedback, conformity, cyberball) ')

if task == 'self-other':
    directory = '../logs/selfother_all'
if task == 'feedback':
    directory = '../logs/peerfeedback_all'
if task == 'conformity':
    directory = '../logs/conformity_all'
if task == 'cyberball':
    directory = '../logs/cyberball'

process_all_csvs(directory,task)
