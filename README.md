# Image Processing GUI

This project provides a simple MATLAB-based Image Processing GUI that allows users to apply various filters to images. Users can import an image, convert it to grayscale, apply Gaussian blur, perform edge detection, and save the processed image. The application is designed for ease of use with interactive buttons.

## Features

- **Import Image**: Load an image from your system.
- **Apply Grayscale**: Convert the image to grayscale.
- **Apply Gaussian Blur**: Apply a Gaussian blur to the image.
- **Edge Detection**: Perform edge detection on the image using the Canny edge detection method.
- **Save Processed Image**: Save the processed image to your system.

## Requirements

- MATLAB (version R2014b or higher)
- Image Processing Toolbox (for `imfilter`, `fspecial`, `edge`, etc.)

## Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/image-processing-gui.git
Open MATLAB and navigate to the cloned repository directory.

Run the GUI by typing the following command in the MATLAB Command Window:

matlab
Copy
Edit
image_processing_gui
Usage
Once the GUI opens, you will see the following options:

-Import Image: Click to choose an image file from your computer.
-Apply Grayscale: Converts the loaded image to grayscale.
-Apply Gaussian Blur: Applies a Gaussian blur filter to the image.
-Apply Edge Detection: Detects edges in the image using the Canny method.
-Save Processed Image: Save the current processed image to your computer.
-Image Processing Workflow
-Import Image: Click the "Import Image" button to load an image from your system.
-Apply Filters: Use the buttons to apply filters like grayscale conversion, Gaussian blur, or edge detection.
-Save Processed Image: Once you've processed the image, you can save it by clicking the "Save Processed Image" button.



License
This project is licensed under the MIT License - see the LICENSE file for details.

Author
Anas Wagih
Acknowledgements
MATLAB Image Processing Toolbox
Canny Edge Detection Algorithm
