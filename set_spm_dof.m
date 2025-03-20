% Use: switch degree of freedom (DOF) in spm coregister.
% set_spm_dof(6)  -> switch DOF to 6
% set_spm_dof(12) -> switch DOF to 12

function set_spm_dof(dof, spm_version)
    % Check input
    if nargin < 1
        dof = 6;
    end
    if dof ~= 6 && dof ~= 12
        error('ValueError: DOF can only set to 6 or 12.');
    end

    if nargin < 2
        spm_version = 12;
    end
    spm_name = 'spm'+string(spm_version);
    
    % Define paths
    spm_path = fullfile(pwd, spm_name);
    spm_coreg_file = fullfile(spm_path, 'spm_coreg.m');

    % Check the paths
    if ~isfolder(spm_path)
        error('FileNotFoundError: Cannot find the directory of '+spm_name+'.');
    end
    if ~isfile(spm_coreg_file)
        error('FileNotFoundError: Cannot find the file spm_coreg.m .');
    end

    % Read file spm_coreg.m
    fid = fopen(spm_coreg_file, 'r');
    if fid == -1
        error('RuntimeError: Cannot read spm_coreg.m .');
    end
    file_content = textscan(fid, '%s', 'Delimiter', '\n', 'Whitespace', '');
    fclose(fid);
    
    file_content = file_content{1}; % convert to cell array
    
    % Define the parameters
    if dof == 6
        new_param = 'def_flags.params   = [0 0 0  0 0 0];';
    else
        new_param = 'def_flags.params   = [0 0 0 0 0 0 1 1 1 0 0 0];';
    end
    
    % Search and replace the content of def_flags.params
    for i = 1:length(file_content)
        if contains(file_content{i}, 'def_flags.params')
            file_content{i} = new_param;
            break;
        end
    end
    
    % Write file spm_coreg.m
    fid = fopen(spm_coreg_file, 'w');
    fprintf(fid, '%s\n', file_content{:});
    fclose(fid);
    
    fprintf('Set DOF of '+spm_name+' to %d succesfully.\n', dof);
end
