% Author: Anas Wagih
% Date: 13/9/2024
% Image processing - FILTERS
function image_processing_gui

    hFig = figure('Name', 'Image Processing GUI', ...
                  'NumberTitle', 'off', ...
                  'MenuBar', 'none', ...
                  'ToolBar', 'none', ...
                  'Position', [100, 100, 800, 600]);

    % Axes for displaying images
    hAxesOriginal = axes('Parent', hFig, 'Units', 'normalized', ...
                         'Position', [0.05, 0.55, 0.4, 0.4]);
    title(hAxesOriginal, 'Original Image');

    hAxesProcessed = axes('Parent', hFig, 'Units', 'normalized', ...
                          'Position', [0.55, 0.55, 0.4, 0.4]);
    title(hAxesProcessed, 'Processed Image');

    % Buttons and controls
    uicontrol('Style', 'pushbutton', ...
              'String', 'Import Image', ...
              'Units', 'normalized', ...
              'Position', [0.05, 0.45, 0.15, 0.05], ...
              'Callback', @importImageCallback);

    uicontrol('Style', 'pushbutton', ...
              'String', 'Apply Grayscale', ...
              'Units', 'normalized', ...
              'Position', [0.25, 0.45, 0.15, 0.05], ...
              'Callback', @grayscaleCallback);

    uicontrol('Style', 'pushbutton', ...
              'String', 'Apply Gaussian Blur', ...
              'Units', 'normalized', ...
              'Position', [0.45, 0.45, 0.15, 0.05], ...
              'Callback', @gaussianBlurCallback);

    uicontrol('Style', 'pushbutton', ...
              'String', 'Apply Edge Detection', ...
              'Units', 'normalized', ...
              'Position', [0.65, 0.45, 0.15, 0.05], ...
              'Callback', @edgeDetectionCallback);

    uicontrol('Style', 'pushbutton', ...
              'String', 'Save Processed Image', ...
              'Units', 'normalized', ...
              'Position', [0.85, 0.45, 0.1, 0.05], ...
              'Callback', @saveImageCallback);

    % Variables to store images
    imageData = struct('original', [], 'processed', []);

    % Callback functions
    function importImageCallback(~, ~)
        % Import an image
        [fileName, filePath] = uigetfile({'*.*', 'All Files'; ...
                                          '*.jpg;*.jpeg;*.png', 'Image Files'});
        if fileName ~= 0
            imageData.original = imread(fullfile(filePath, fileName));
            axes(hAxesOriginal);
            imshow(imageData.original);
            title(hAxesOriginal, 'Original Image');
            imageData.processed = []; % Reset processed image
        end
    end

    function grayscaleCallback(~, ~)
        % Convert to grayscale
        if ~isempty(imageData.original)
            if size(imageData.original, 3) == 3
                imageData.processed = rgb2gray(imageData.original);
            else
                imageData.processed = imageData.original;
            end
            axes(hAxesProcessed);
            imshow(imageData.processed);
            title(hAxesProcessed, 'Grayscale Image');
        else
            errordlg('No image loaded. Please import an image first.', 'Error');
        end
    end

    function gaussianBlurCallback(~, ~)
        % Apply Gaussian blur
        if ~isempty(imageData.original)
            if isempty(imageData.processed)
                processedImage = imageData.original;
            else
                processedImage = imageData.processed;
            end
            sigma = 2; % Standard deviation for Gaussian kernel
            gaussianFilter = fspecial('gaussian', [5 5], sigma);
            imageData.processed = imfilter(processedImage, gaussianFilter, 'same');
            axes(hAxesProcessed);
            imshow(imageData.processed);
            title(hAxesProcessed, 'Gaussian Blurred Image');
        else
            errordlg('No image loaded. Please import an image first.', 'Error');
        end
    end

    function edgeDetectionCallback(~, ~)
        % Apply edge detection
        if ~isempty(imageData.original)
            if isempty(imageData.processed)
                processedImage = rgb2gray(imageData.original);
            else
                processedImage = imageData.processed;
            end
            imageData.processed = edge(processedImage, 'canny');
            axes(hAxesProcessed);
            imshow(imageData.processed);
            title(hAxesProcessed, 'Edge Detected Image');
        else
            errordlg('No image loaded. Please import an image first.', 'Error');
        end
    end

    function saveImageCallback(~, ~)
        % Save processed image
        if ~isempty(imageData.processed)
            [fileName, filePath] = uiputfile({'*.jpg', 'JPEG Image'; ...
                                              '*.png', 'PNG Image'}, ...
                                              'Save Processed Image');
            if fileName ~= 0
                imwrite(imageData.processed, fullfile(filePath, fileName));
                msgbox('Processed image saved successfully.', 'Success');
            end
        else
            errordlg('No processed image to save. Please process an image first.', 'Error');
        end
    end
end
