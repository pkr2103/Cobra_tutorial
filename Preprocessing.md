# Preprocessing using bpipe
====================================================

Steps

1. Clone the cobralab bpipe repo to your account on SCINET by typing the following command:
 
  ``git clone https://github.com/CobraLab/minc-bpipe-library.git``

  this creates a directory in your account with folders and functions for running the preprocessing steps.
  
  
2. Edit the bpipe repo to prepare for running:
 
  ``rm minc-bpipe-library/bpipe.config``

  ``sed -i 's#/opt/quarantine#/project/m/mchakrav/quarantine#g' minc-bpipe-library/minc-library.bpipe``


3. Edit ``pipeline.bpipe`` with the processes you want to run, which are all listed in ``minc-library.bpipe``
 
   open by typing ``vim minc-bpipe-library/pipeline.bpipe`` and remove the word "preprocess" from the between the brackets on the 4th line and in that location type ``n4correct + linear_antsRegistration + cutneckapplyautocrop + beast`` there.  Save and exit the file by typing ``:wq``.


4. Make a directory for saving the output of preprocessing steps by typing ``mkdir outputs``.  Then 'move' into that directoy by typing ``cd outputs``

5. Load suite of background functions for running bpipe
   ``module load scinet``

6. Use ``../minc-bpipe-library/bpipe-batch.sh ../minc-bpipe-library/pipeline.bpipe /path_to_inputs/*.mnc > joblist`` to generate a joblist.  

7. Use ``../minc-bpipe-library/qbatch joblist 1 12:00:00`` to submit jobs to scinet queing system
