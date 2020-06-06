# gostin: Geoscience Open Source Tie-In


Work in Progress. Check-out

- Channel #t20-gostin on Slack (https://swu.ng/slack)
- The notes https://hackmd.io/@prisae/t20-gostin-ideas

Any contribution welcome, just ping us on Slack!

To create the environment simply run
```bash
conda env create -f environment.yml
```
This will create a new conda environment called `gostin`.

To activate and deactivate the environment run
```bash
conda activate gostin
conda deactivate
```

To completely remove the environment run
```bash
conda remove --name gostin --all
```


## Docker

Build the base image locally:

```
docker build -t softwareunderground/gostin -f base.dockerfile .
```

To run that image interactively:

```
docker run -it softwareunderground/gostin
```

then you can build the image with Jupyter lab:

```
docker build -t softwareunderground/gostin-jupyter -f jupyter.dockerfile .
```

then to run Jupyter Lab:

```
docker run -p 8889:8889 softwareunderground/gostin-jupyter
```

Perhaps you want to mount some local notebooks you have when running the
`softwareunderground/gostin-jupyter` container. You can mount this directory
by doing:

```
docker run -v $PWD:/root/gostin/ -p 8889:8889 softwareunderground/gostin-jupyter
```

and then you can run the `pyvista.ipynb` notebook.
