# Preprocessing using bpipe
====================================================

Steps

1. Clone the cobralab bpipe repo to your account on SCINET by typing the following command:
  ``git clone https://github.com/CobraLab/minc-bpipe-library.git``
2. Edit the bpipe repo to prepare for running:
  ``rm minc-bpipe-library/bpipe.config``
  ``sed -i 's#/opt/quarantine#/project/m/mchakrav/quarantine#g' minc-bpipe-library/minc-library.bpipe``
4. ``mkdir outputs``
5. Load suite of background functions for running pipe
   ``module load scinet``
6. Use ``..//minc-bpipe-library/bpipe-batch.sh ../minc-bpipe-library/pipeline.bpipe /path/to/my/inputs/*.mnc > joblist`` to generate a joblist
7. Use ``../minc-bpipe-library/qbatch joblist 1 12:00:00`` to submit jobs to scinet queing system