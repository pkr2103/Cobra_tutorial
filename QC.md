# Generating QC PNGS for MAGeT
====================================================

Steps


A. On your computer, you’ll need to have Xcode installed to download and install minc-toolkit.  Download minc-toolkit by going to ``http://bic-mni.github.io/#on-macos-x-107-and-109``.  Download Version 1.0.08 by clicking on the link appropriate for your operating system.    

B. For the run you’d like to qc download 3-4 images with their respective labels from scinet.  Images are in your MAGeT folder in ``input/subject/brains/``, which will be labeled *beastextract.mnc.  Labels are in ``output/fusion/majority_vote``, which will be labeled *beastextract_labels.mnc.  Download it to your machine by using ``scp username@login.scinet.utoronto.ca:/path_to_image or path_to_label``

C.  Now that you have some images and labels on your machine you’ll inspect them with ``Display`` from mind-toolkit.  To get to it you’ll need to activate the minc-toolkit by typing ``source ~/../../opt/minc/minc-toolkit-config.sh``


D. Open an image and label by typing ``Display image -label image_label``.  Scroll through the image and locate the slice number that the label first appears on and the slice where the label ceases to be visible.  These numbers will be different in the axial, sagital, and coronal planes.

E. Now back on scinet, we’ll set up our session to run the qc script.  First load the requisite background functions by typing ``module load minc-tools/mice-chihrio``.
 
F. Make a folder in your MAGeT project folder for your qc pngs with ``mkdir qc`` and navigate there with ``cd qc``. Copy the qc script ``nih_qc.sh`` there.

G. Recalling the slice number on which the labels appeared and disappeared, run the qc script. ``./nih_qc.sh path_to_images/* path_to_labels/* —-a slice_number_of_first_label_in_axial slice_number_of_last_label_in_axial —-s slice_number_of_first_label_in_sagital slice_number_of_last_label_in_sagital —-c slice_number_of_first_label_in_coronal slice_number_of_last_label_in_coronal``    
