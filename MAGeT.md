# MAGeT Instructions
=======================

### Steps

1. Download the cobralan MAGeTbrain repository:

    ``git clone https://github.com/CobraLab/MAGeTbrain.git ``

which will create a MAGeTbrain directory

2. Load the background functions needed to run MAGeT

    ``module load minc-tools/mice-chihiro``

3. Now we need to make sure we are using the type of MAGeT that generates morphometric measures.  This type of MAGeT implementation is stored as a ‘branch’ of the github repo.  Make sure you switch to the appropriate branch, which you can do by navigating into the ``MAGeTbrain`` directory and typing:

   ``git checkout -t remotes/origin/mb_morpho_tmp``

4 (optional). To check which branch of MAGeT you are on you can type:

   ``git status``

a message will pop up saying what branch you’re on.  If you’re on the mb_morpho_tmp branch you can navigate back out of the MAGeTbrain directory.

5.  Now that we’re using the type of MAGeT, we need to activate it in our current shell session so we can use its functions by typing:

   ``source MAGeTbrain/bin/activate``

6. Now we can create a folder where we will run MAGeT.  Once you do that and navigate into it, MAGeT has a function that will setup the appropriate directory structure for your input. Type:

   ``mb init``

and this will create an ``input`` directory with 4 subdirectories ``atlases model subjects templates``. You’ll want to keep in mind that the ``subjects`` folder will have a subfolder for the images you want to process at ``subjects/brains``, and ``templates`` will have a subfolder for the select images you want to use for that purpose at ``templates/brains``

7. You will move files from the output of your preprocessing into the ``templates/brains`` and ``subjects/brains`` folder.  Currently we use 21 representative images into the ``templates/brains`` folder and then all images you want to study into the ``subjects/brains`` folder.

8. The output of the bpipe processing will have lots of files.  But you want to move only one kind of those files for each image, which will be denoted by the end of the file.  To move the relevant files type:

   ``cp /path/to/bpipe/outputs/*n4correct.beastextract.mnc``

this will copy all files that end in that pattern.  There should be one for each scan that you preprocessed.

9. You’ll also need to copy the appropriate atlas brains and labels from the cobralab website with the appropriate model as well.

10. Now that you’ve populated your MAGeT input folder with the right files you’re almost ready to run MAGeT. But first go back to your project folder where you can ‘see’ the input folder.  You can check if you’ve done everything correctly to run MAGeT by typing

  ``mb check``

this makes sure you’ve set up your input directory correctly.  If everything is in order the ``mb check`` command will not return anything.  It only produces text if there is an error. 

11.  Now you can run MAGeT creating volumetric, displacement and surface area data using the following command:

   ``mb run —surfaces —voronoi``

and now you’re running MAGeT.


