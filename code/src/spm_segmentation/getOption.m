% (C) Copyright 2020 Remi Gau, Marco Barilari

function opt = getOption()
    %
    % returns a structure that contains the options chosen by the user to run
    % slice timing correction, pre-processing, subject and group level analysis.
    %
    % for more info see:
    % <https://cpp-bids-spm.readthedocs.io/en/latest/set_up.html#configuration-of-the-pipeline>
    % <https://cpp-bids-spm.readthedocs.io/en/latest/defaults.html#checkoptions>

    if nargin < 1
        opt = [];
    end

    % If the following fields are left empty then all subjects will be analyzed.
    % opt.groups = {''};
    % opt.subjects = {[]};
    %
    opt.subjects = {'pilot001', 'pilot004', 'pilot005'};

    opt.query.modality = 'anat';
    opt.query.ses = '001';
    opt.query.desc = 'skullstripped';
    opt.query.acq = 'r0p375';
    opt.query.suffix = 'UNIT1';

    opt.pipeline.type = 'preproc';
    opt.anatOnly = 'true';
    
    opt.bidsFilterFile.t1w.suffix = 'UNIT1';
  
    opt.segment.biasfwhm = 18;
    opt.segment.samplingDistance = 2;
    
    this_dir = fileparts(mfilename('fullpath'));
    root_dir = fullfile(this_dir, '..', '..', '..');
    opt.dir.raw = fullfile(root_dir, 'inputs', 'raw');
    opt.dir.derivatives = fullfile(root_dir, 'outputs', 'derivatives');

    % If you use 'individual', then we stay in native space (that of the anat image)
    % set to 'MNI' to normalize data
    opt.space = 'individual';

    %% DO NOT TOUCH
    opt = checkOptions(opt);
    saveOptions(opt);

end
