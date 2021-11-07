# Speech Recognition System

## MFC Creation

To create .mfc file for your audio data run the main.m script using MATLAB making sure to edit the filenames for your specific .wav files in both main.m and writeFile.main

## Proto File Creation

to Create a proto file for training, run the writeProtoFile.m script specifying your number of channels as channels/2 from the filterbank.m file

## Initilising

To initilise a model run the following command with HTK installed replacing <Labeled Name> with a name from the label file:

1.`HInit -S lists/trainlist.txt -l <Labeled Name> -L labels/train -M hmms -o <Labeled Name> -T 1 lib/proto8States.txt`

Once all of the models have been initilised you will then need to create a NET file from your GRAM file using HParse:

2. `HParse GRAM NET` (cd lib before running)

You can then test the model by running the following replacing <.mfc file> with your test .mfc file:

To run a batch test run the following:

`HVite -T 1 -S lists/testList.txt -d hmms/ -w lib/NET -l results lib/dict lib/words`

To view the results of the testing run the following:

`HResults -p -e "???" sil -e "???" <sp> -L labels/test lib/words results/*.rec`