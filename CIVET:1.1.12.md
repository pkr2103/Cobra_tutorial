# CIVET 1.1.12 Processing on Scinet
====================================================

Steps

A. Make a folder for running your CIVET project.  In that folder create an input and an output folder with mkdir.  

B. CIVET needs two types of files generated from the preprocessing steps for each scan.  The files end in 1) n4correct.cutneckapplyautocrop.mnc and 2) t1.n4correct.beastmask.mnc. 

copy to the input folder the relevant files with ``cp path_to_preprocessing_output/*n4correct.cutneckapplyautocrop.mnc path_to_civet_input/``.  And ``cp_path_to_preprocessing_output/*t1.n4correct.beastmask.mnc path_to_civet_input/`` for the other file type.

C. Move the ``nih_rename.sh`` script and the the ``civet_run_template`` script to your CIVET project folder.  Use the ``nih_rename.sh`` script to reformat the file names for civet by running it in your project folder.  Type ``./nih_rename.sh`` to run it.

D. Now run ``civet_run_template`` (by typing ``./civet_run_template``), which will generate a file called job_list that records the settings you want to use.  You can adjust the setting before running if you want ``civet_run_template`` by typing ``vim civet_run_template``.  Things you may want to adjust include N3-distance.
 
E. Load suite of background functions for running CIVET
   ``module load CIVET/1.1.12``

F. Run civet by typing ``qbatch job_list 4 10:00:00``.  
