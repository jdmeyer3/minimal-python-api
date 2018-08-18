# minimal-python-api
Using Twitter's Pants build tool, creating a minimal docker image using a compiled PEX


## What is pants?
Pants (Python Ant) is a build to designed by Twitter to help with managing Polyglot Monorepos. It can be used to help manage inter-code dependencies, build and compile different languages (scala, python, go, etc.) and build distributions. For more information on Pants, check them out at https://www.pantsbuild.org/index.html

## Then what is a PEX?
A PEX (Python EXecutable) are executable python environments as outlined in [PEP441](https://legacy.python.org/dev/peps/pep-0441/). They are created in the spirit of virtualenvs, but are much more lightweight. The PEX enables the developer to simply deploy a python application simply by copying the *.pex file and executing it. 

# Instructions
I will work on better instructions, these are just initial notes. If this gains some traction, I'll do a more hands on tutorial as I better understand Pants myself. 

## Pants build process
//TODO
# Building the PEX
In the root directory run
```bash
./pants binary src/main/python/api/src
```
This will create the PEX file in the `dist` directory

# Building packages

## Creating a tarball
In the root directory run
```bash
./pants setup-py src/main/pyton/api:lib 
```
This will create a tarball within the `dist` directory.

## Creating a wheel
Create a tarball and then run `pip wheel <tarball_name>` against the file to create the wheel.

Alternatively to create a python wheel file as well you'll need to run
```bash
./pants setup-py src/main/python/api:lib --setup-py-run="bdist_wheel --dist-dir=<YOUR FULL DIRECTORY PATH>/pantstest/dist"
```
This will create a wheel file in your `dist` folder. If you don't specify the full path, the wheel will be inside the package directory in your `dist` folder. For example, if you create the api wheel file without specifying the --dist-dir, the wheel file will be `~/minimal-python-api/dist/api-0.1.0/dist/example_api-0.1.0-py2-none-any.whl`.

# Creating the Docker image

For the docker image I'm simply using a Python Alpine image. NOTE. make sure the python version you use for the alpine image matches what's in your `pants.ini` file. Copy the PEX into the container and run it. It's that simple. I'll work on gathering size comparisons of deploying the Python app via a wheel vs. the PEX. In my experience, this is the simpliest (in terms of the Dockerfile) and smallest Docker Python app I've made. 
