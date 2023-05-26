# Frigate: Frugal Spatio-temporal Forecasting on Road Networks
This repository is the official implementaion of [**Frigate: Frugal Spatio-temporal Forecasting on Road Networks**](https://doi.org/10.1145/3580305.3599357)

## Requirements
This code has been tested under two configurations:  
**Config one**
- Python: 3.9.0
- PyTorch: 1.9.0 (CUDA 11.1)
- PyTorch Geometric: 1.7.2
- Numpy: 1.23.3
- Pandas: 1.5.1
- SciPy: 1.9.1
- NetworkX: 2.2.8

**Config two**
- Python: 3.9.0
- PyTorch: 1.13.1
- PyTorch Geometric: 2.2.0
- Numpy: 1.23.5
- Pandas: 1.5.2
- SciPy: 1.9.3
- NetworkX: 2.8.8

Other requirements: tensorboardX and tqdm are also required for logging and display

There is a full list of packages from ```$ pip freeze``` from the two conda environments to help in case of package clashes.

## Data
Download the [preprocessed dataset](https://drive.google.com/file/d/1l715iYVktwi8WFs_eOAvoVWS2pPzYiDJ/view?usp=share_link)
from here. Unzip the zip file, and move the contents to be inside the ```data``` folder.

The expected file structure after this step is:
```bash
Frigate
├── data
│   ├── Beijing
│   ├── Chengdu
│   └── Harbin
├── logs
├── model
│   ├── __init__.py
│   ├── model.py
│   ├── tester.py
│   └── trainer.py
├── outputs
│   ├── models
│   ├── predictions
│   └── tensorboard
├── run.sh
├── run_test.sh
├── test.py
├── train.py
└── utils
    ├── __init__.py
    ├── data_utils.py
    └── test_data_utils.py
```

## Training
Script named ```run.sh``` is  provided to facilitate training. Just change the dataset's name in line 1 and
the path to seen nodes in line 17 for various configurations. There are a few seen.npy already in the dataset folders.

```run.sh``` takes one argument that tells which GPU to run the training code on. For example to run the training code on GPU 0,
the command is

```bash
bash run.sh 0
```

## Evaluation
Script named ```run_test.sh``` is provided to facilitate evaluation. You need to set 4 things in the file:
1. ```dataset```
2. ```seen_path```
3. ```run_num```
4. ```model_name```

Run number and model name are used to locate the trained model can be found from the logs. Note, the model name
is just the model file's name, not the full path to it. The test script automatically loads the correct model based
on the ```run_num``` parameter.  
To run the evaluation script on GPU 0, do the following:

```bash
bash run_test.sh 0
```

The script will display the MAE metric and will save the predictions in ```outputs/predictions/run_<run_number>/pred_true.npz```.
A metric calculation script is also provided in ```outputs/predictions``` that takes a file in the format saved by this script and
computes the metrics.

## ACM Reference Format
> Mridul Gupta, Hariprasad Kodamana, and Sayan Ranu. 2023. Frigate: Frugal Spatio-temporal Forecasting on Road Networks. _In Proceedings of the 29th ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD ’23), August 6–10, 2023, Long Beach, CA, USA_. ACM, New York, NY, USA, 12 pages. https://doi.org/10.1145/3580305.3599357

### Bibtex
```tex
@inproceedings{FrigateGNN,
author = {Gupta, Mridul and Kodamana, Hariprasad and Ranu, Sayan},
title = {Frigate: Frugal Spatio-temporal Forecasting on Road Networks},
booktitle = {Proceedings of the 29th ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD '23)},
location = {Long Beach, CA, USA},
publisher = {ACM},
address = {New York, NY, USA},
numpages = {12},
urls = {https://doi.org/10.1145/3580305.3599357},
year = {2023},
doi = {10.1134/3580305.3599357},
}
```
