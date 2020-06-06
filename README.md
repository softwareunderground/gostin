# gostin: Geoscience Open Source Tie-In


Work in Progress. Check-out

- Channel #t20-gostin on Slack (https://swu.ng/slack)
- The notes https://hackmd.io/@prisae/t20-gostin-ideas

Any contribution welcome, just ping us on Slack!

To create the environment simply run
```bash
conda env create -f environment.yml
```
This will create a new conda environment called `empot`.

To activate and deactivate the environment run
```bash
conda activate empot
conda deactivate
```

To completely remove the environment run
```bash
conda remove --name empot --all
```


## Docker

Build the base image locally:

```
docker build -t gostin -f base.dockerfile .
```

To run that image interactively:

```
docker run -it gostin
```
