function process_export(filename, subdir, minimumPointsDistance, varargin)
    addpath('matlab2tikz-master\src');

    fprintf('Dieses Skript muss im Unterordner ExtractThesisData \nmit dem Unterordner export ausgeführt werden!\n\n');
    
    set(0,'defaulttextinterpreter','latex');
    
    set(gca, 'box', 'on');

    if minimumPointsDistance == -1
        minimumPointsDistance = 1e-4;
    end
    
    fprintf('Cleaning figure: Delta = %f \n', minimumPointsDistance);
      
    % standard values
    export_options.no_float_format_optimization = '0';
    export_options.normal_size = '1';
    export_options.externalize = true;
    export_options.this_is_a_map = false;
    
    % override values    
    if nargin == 4
        export_options_param = varargin{1};
        fields = fieldnames(export_options_param);
        for i=1:numel(export_options_param)
            export_options.(fields{i}) = export_options_param.(fields{i});
        end
    end
              
    WIDTH_STR = '0.9\textwidth';    
    
    if export_options.this_is_a_map == '1'
    %%   
        cleanfigure('minimumPointsDistance', minimumPointsDistance);
        matlab2tikz(filename, ...
            'externalData', export_options.externalize, ...
            'relativeDataPath', ['pics/tikzfrommatlab/' subdir], ...
            'showInfo', false, ...
            'width', WIDTH_STR, ... % linewidth?
            'floatFormat', '%.4f'...
        ); 
    else
    %%
    
        if export_options.no_float_format_optimization == '0'
            % execute normally
            cleanfigure('minimumPointsDistance', minimumPointsDistance);
            matlab2tikz(filename, ...
                'externalData', export_options.externalize, ...
                'relativeDataPath', ['pics/tikzfrommatlab/' subdir], ...
                'showInfo', false, ...
                'width', WIDTH_STR, ... % linewidth?
                'height', '5cm',...
                'floatFormat', '%.7f'...
            ); 
        else
            % no floatFormat optimizations!!!
            cleanfigure('minimumPointsDistance', minimumPointsDistance);
            matlab2tikz(filename, ...
                'externalData', export_options.externalize, ...
                'relativeDataPath', ['pics/tikzfrommatlab/' subdir], ...
                'showInfo', false, ...
                'width', WIDTH_STR, ... % linewidth?
                'height', '5cm'...
            ); 

        end
    end
end
