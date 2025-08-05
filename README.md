# COVID-19 Kalman Filter

[![MATLAB](https://img.shields.io/badge/MATLAB-R2020a+-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Kalman Filter](https://img.shields.io/badge/algorithm-Kalman%20Filter-green.svg)](https://en.wikipedia.org/wiki/Kalman_filter)

> **Discrete-time Kalman filter implementation for COVID-19 case estimation using real epidemiological data from the BC Centre for Disease Control (BCCDC).**

This project demonstrates the application of advanced signal processing and statistical estimation techniques to public health data analysis, showcasing how Kalman filters can effectively track disease progression and provide reliable predictions despite noisy measurement data.

## Project Overview

During the COVID-19 pandemic, accurate estimation and prediction of case numbers became crucial for public health decision-making. This project implements a discrete-time Kalman filter to address challenges in epidemiological data analysis, including:

- **Noisy measurements**: Daily case reports contain reporting delays and measurement uncertainties
- **State estimation**: Extracting true underlying infection trends from observed data
- **Real-time processing**: Updating estimates as new data becomes available
- **Uncertainty quantification**: Providing confidence intervals for predictions

## Key Features

- **Multiple Filter Variants**: Three different Kalman filter implementations with varying complexity
- **Real Data Integration**: Validated using actual COVID-19 data from BCCDC
- **Epidemiological Modeling**: Incorporates pandemic growth dynamics in state-space representation
- **Noise Reduction**: Effectively filters measurement noise from daily case reports
- **Trend Prediction**: Provides 7-14 day forecasts with confidence intervals
- **Interactive Analysis**: MATLAB Live Script for hands-on exploration

## Algorithm Components

### Core Implementation Files

| File | Description |
|------|-------------|
| `kalmanFilter.m` | Basic discrete-time Kalman filter implementation |
| `kalmanFilter2.m` | Enhanced version with improved noise modeling |
| `kalmanFilter3.m` | Advanced variant with adaptive parameters |
| `panmodel.m` | Epidemiological growth model (exponential/logistic phases) |
| `resetVariables.m` | Variable initialization and parameter setup |

### Mathematical Framework

The discrete-time system is modeled as:

```matlab
x(k+1) = F*x(k) + w(k)    % State evolution
y(k) = H*x(k) + v(k)      % Measurement model
```

**Where:**
- `x(k)`: State vector (infection parameters)
- `F`: State transition matrix
- `H`: Measurement matrix  
- `w(k)`: Process noise (Q covariance)
- `v(k)`: Measurement noise (R covariance)

## Getting Started

### Prerequisites

- MATLAB R2020a or later
- Signal Processing Toolbox (recommended)
- Statistics and Machine Learning Toolbox (recommended)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Junaidk11/simple_kalman_filter.git
   cd simple_kalman_filter
   ```

2. **Launch MATLAB** and navigate to the project directory

3. **Run the Live Script:**
   ```matlab
   open('simple_kalman_filter_livescript.mlx')
   ```

### Quick Start Example

```matlab
% Load COVID-19 data
data = readmatrix('bccdc_data.csv');
cases = data(:, 2);  % Daily case numbers

% Initialize filter parameters
resetVariables;

% Run basic Kalman filter
filtered_cases = kalmanFilter(cases);

% Plot results
plot(1:length(cases), cases, 'b-', 1:length(filtered_cases), filtered_cases, 'r-');
legend('Raw Data', 'Filtered Data');
title('COVID-19 Case Estimation using Kalman Filter');
```

## Results & Performance

The Kalman filter implementation demonstrates significant improvements over raw data analysis:

### Key Achievements

- **Noise Reduction**: Successfully filtered measurement noise from daily case reports
- **Trend Identification**: Accurately tracked underlying infection trends despite data irregularities  
- **Prediction Capability**: Provided reliable short-term forecasts with confidence intervals
- **Real-time Processing**: Efficient algorithm for processing new data points

### Validation Results

Using BCCDC data from early pandemic phases:
- Reduced mean squared error compared to simple moving averages
- Better capture of exponential growth phases
- Improved detection of trend changes and inflection points
- Robust performance across different noise levels

## Project Structure

```
simple_kalman_filter/
├── README.md                              # Project documentation
├── kalmanFilter.m                         # Basic Kalman filter
├── kalmanFilter2.m                        # Enhanced filter variant
├── kalmanFilter3.m                        # Advanced adaptive filter
├── panmodel.m                             # Pandemic growth model
├── resetVariables.m                       # Parameter initialization
├── bccdc_data.csv                         # COVID-19 dataset (BCCDC)
├── simple_kalman_filter_livescript.mlx    # Interactive MATLAB Live Script
├── kalman_filter_report.pdf               # Detailed technical report
└── project.pdf                            # Project documentation
```

## Data Source

This project uses real COVID-19 case data from the **British Columbia Centre for Disease Control (BCCDC)**. The dataset includes daily case numbers from the early phases of the pandemic, providing a realistic testbed for the filtering algorithms.

## Mathematical Concepts

This project demonstrates practical application of:

- **State-space modeling** in epidemiological systems
- **Recursive estimation** theory and optimal filtering
- **Gaussian noise models** and covariance matrix design
- **Statistical inference** and uncertainty quantification
- **Signal processing** techniques for public health data

## Documentation

- **📄 [Technical Report](kalman_filter_report.pdf)**: Comprehensive analysis and mathematical derivation
- **📄 [Project Documentation](project.pdf)**: Additional project details and context
- **💻 [Live Script](simple_kalman_filter_livescript.mlx)**: Interactive MATLAB implementation
- **🌐 [Portfolio Page](https://junaidk11.github.io/projects/kalman-filter-covid.html)**: Detailed project showcase

## Algorithm Workflow

1. **Prediction Step**: Forecast next state using system dynamics
2. **Update Step**: Correct prediction using new measurement  
3. **Covariance Update**: Update uncertainty estimates
4. **Parameter Adaptation**: Adjust filter parameters based on performance

## Future Enhancements

- **Extended Kalman Filter**: Handle nonlinear epidemiological models
- **Multi-variate Analysis**: Incorporate multiple data streams (hospitalizations, deaths, testing rates)
- **Adaptive Filtering**: Real-time parameter estimation and model selection
- **Spatial Modeling**: Extend to multi-region analysis with geographic coupling

## Academic Context

This project was developed as part of a undergraduate signal processing course, demonstrating:
- Advanced mathematical modeling skills
- Practical application of theoretical concepts
- Real-world problem-solving capabilities
- Professional software development practices


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **BC Centre for Disease Control** for providing real COVID-19 data
- **Signal Processing Course Instructors** for guidance and feedback
- **MATLAB Community** for excellent documentation and examples
