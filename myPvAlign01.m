% Twinkle twinkle little star (id=8);
p=[62.9 61.8 61.8 61.8 61.8 61.8 61.4 61.4 61.4 61.4 60.9 61.4 61.8 61.4 60.9 60.9 60.9 60.9 60.9 60.9 60.9 60.9 61.4 61.8 62.9 63.9 65.7 65.7 66.3 66.3 67 67 67 67 67.7 67.7 67.7 67.7 67 68.4 67 67 67 67 67 67 67 67 67 67 67 67 67.7 67.7 68.4 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 68.4 68.4 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 69.1 68.4 67.7 67 66.3 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 67 66.3 66.3 65.7 65.7 65.7 65.1 64.5 64.5 64.5 65.1 65.1 65.1 65.1 65.1 65.1 65.1 65.1 65.7 65.7 65.7 65.1 65.1 65.1 65.1 65.1 65.1 65.1 65.1 64.5 64.5 63.4 64.5 63.9 63.9 63.9 63.9 63.9 63.9 63.9 63.9 63.9 64.5 63.4 65.1 63.9 63.9 63.9 63.9 63.9 63.9 63.9 63.9 63.9 63.9 63.4 62.3 63.9 62.3 61.8 61.4 61.4 61.4 61.8 61.8 61.8 61.8 61.8 61.8 61.4 63.4 62.3 61.8 61.8 61.8 61.8 61.8 61.8 61.8 61.8 61.8 61.8 61.8 60.9 61.4 60.4 60 60.4 60 60.4 60.4 60.4 60.4 60.4 60 60 60 60 60 60 61.4];
q=[60 60 67 67 69 69 67 65 65 64 64 62 62 60 67 67 65 65 64 64 62 67 67 65 65 64 64 62 60 60 67 67 69 69 67 65 65 64 64 62 62 60];
[minDist, dpPath]=myPvAlign(p, q)
figure; myPvAlignPlot(p, q, dpPath);	% For plotting the DP path
inducedP=q(dpPath(2,:));
figure; plot(1:length(p), p, '.-', 1:length(inducedP), inducedP, '.-');
legend({'Original pitch vector', 'Induced pitch vector'}, 'location', 'northOutside', 'orientation', 'horizontal');
fprintf('minDist=%g\n', minDist);
fprintf('dpPath=%s\n', mat2str(dpPath));
return

% If you want to do playback, download SAP toolbox at http://mirlab.org/jang/matlab/toolbox/sap and proceed as follows.
addpath d:/users/jang/matlab/toolbox/sap	% You need to change this to add SAP toolbox to the search path.
% Play back of the oringal note
note=[60 32 60 32 67 32 67 32 69 32 69 32 67 64 65 32 65 32 64 32 64 32 62 32 62 32 60 64 67 32 67 32 65 32 65 32 64 32 64 32 62 64 67 32 67 32 65 32 65 32 64 32 64 32 62 64 60 32 60 32 67 32 67 32 69 32 69 32 67 64 65 32 65 32 64 32 64 32 62 32 62 32 60 32];
notePlay(note);
% Playback of the singing pitch vector
pvPlay(p);
% Playback of the induced singing pitch vector
pvPlay(inducedP);