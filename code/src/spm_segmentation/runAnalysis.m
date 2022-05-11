% (C) Copyright 2019 Remi Gau

clear;
clc;

addpath(fullfile(pwd, '..'));
initEnv;

opt = getOption();

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
BIDS = bids.layout(opt.dir.raw, ...
                   'use_schema', 0);

opt.query = [];

opt.query.modality = 'anat';
opt.query.ses = '001';
opt.query.desc = 'skullstripped';
opt.query.acq = 'r0p375';
opt.query.suffix = 'UNIT1';

bids.query(BIDS, 'data', opt.query)

% reportBIDS(opt);

unzip = true;

bidsCopyInputFolder(opt, unzip);

bidsSegmentSkullStrip(opt);


