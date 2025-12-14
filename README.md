<h1 align="center">sworkflow</h1>

# About
SW- Streamlined Kernel Compilation tool

sworkflow is an auto kernel compilation tool designed to streamline the process of compiling the Linux kernel and significantly reduce the overhead involved in setting up the development environment.

Using sworkflow is simple and straightforward. The tool comes with a user-friendly documentation that guides developers through the setup process and kernel compilation.

It is a simple and easy-to-use tool to compile Linux kernel.

The documentation about installation can be found in Documentation repository:

https://github.com/sworkflow-project/Documentation

# Install

## Supported Platforms

Automatic dependency installation is currently supported on Debian-based systems.

If you want to build documentation, displayed on the website, install pip package.

Ubuntu LTS is the baseline platform. Dependencies on your system should be at least as recent as those provided by Ubuntu LTS.


## Manual Install

In the sw directory, type:
```
./install

```
This command will install sw and append the following lines at the end of .bashrc.:
```
# sw
PATH=$HOME/sworkflow/bin:$PATH #sw

```

If another shell is used(for example, ksh), manually add path to sw to PATH environment variable.

To check if installation was ok, open another terminal and type:

```
sw help

```

## Workflow setup

## Download sw

First of all, let's download sw:
```
git clone https://github.com/sworkflow/sworkflow.git

```
## Installing sw

First, cd into the repository you cloned:
```
cd sworkflow
```
Then install sw:
```
./setup.sh i
```

After installing sw, you should be able to call sw directly from the command line. For example, to display sw's help message:

```
sw help
```

After installing, you should check that everything is working as expected. Try running:

```
sw version
```

# Contributing
We appreciate that you want to contribute to the project's improvement.
If you are looking for a good starting point, check
[these issues](https://github.com/danascape/sworkflow/labels/good%20first%20issue)
and don't forget to read our
[Contributor's Guide](https://github.com/danascape/sworkflow/blob/main/CONTRIBUTING.md).

# Contact
The best way to connect or get help is by creating [issues](https://github.com/danascape/sworkflow/issues) or by making a [pull request](https://github.com/danascape/sworkflow/pulls).

# License
```xml
Copyright 2019 danascape (Saalim Quadri)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
