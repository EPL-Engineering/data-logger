function H = open_data_log(fn)
% OPEN_DATA_LOG - read header of analog data streamed to disk with Data Logger VI.
% Usage: H = open_data_log(fn)
%
% --- Inputs ---
% fn : filename
%
% --- Outputs ---
% DL : data structure 
%

% Open binary data file for reading
fp = fopen(fn, 'rb', 'b');
if fp < 0
   error('Error opening file.');
end

% Header information
headerSize = 0;

% Number of channels
nch = fread(fp, 1, 'int32');
headerSize = headerSize + 4;

% Names of channels
names = cell(nch, 1);
for k = 1:nch
   n = fread(fp, 1, 'int32');
   headerSize = headerSize + 4;
   
   if n > 0
      names{k} = fread(fp, [1 n], '*char');
      headerSize = headerSize + n;
   else
      names{k} = sprintf('AI%02d', k);
   end
end

% Sampling rate
Fs = fread(fp, 1, 'double');
headerSize = headerSize + 8;

% "Frame size"
pts_per_read = fread(fp, 1, 'int32');
headerSize = headerSize + 4;

fclose(fp);

s = dir(fn);
nrecords = (s.bytes - headerSize) / (nch * pts_per_read * 8);


H.fn = fn;
H.pts_per_read = pts_per_read;
H.nch = nch;
H.names = names;
H.Fs = Fs;
H.headerSize = headerSize;
H.nrecords = nrecords;

%--------------------------------------------------------------------------
% END OF OPEN_DATA_LOG.M
%--------------------------------------------------------------------------
