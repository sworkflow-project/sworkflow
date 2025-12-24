======================
How to Setup sworkflow
======================

.. _setup-tutorial:

.. contents::
   :depth: 1
   :local:
   :backlinks: none

.. highlight:: console

Downloading sworkflow
---------------------

First, clone the repository::

    git clone https://github.com/sworkflow-project/sworkflow.git

Installing sworkflow
--------------------

Change into the repository directory::

    cd sworkflow

Install for your user (recommended)::

    make install

Or install system-wide::

    sudo make install

After installing, you should be able to call ``sw`` directly from the
command line. For example, to display sw's help message::

    sw help

Verify the installation::

    sw version

Using sworkflow
---------------

sworkflow must be run from within a Linux kernel source tree.

Building a Kernel
~~~~~~~~~~~~~~~~~

1. Navigate to your kernel source::

       cd /path/to/kernel-source

2. Build for a specific device::

       sw build <device>

   For example::

       sw build mainline

Creating a Device Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a new device configuration interactively::

    sw init

This will prompt you for:

- Device name
- Target architecture
- Kernel defconfig
- Cross-compiler paths
- Clang usage
- DTBO settings

The configuration is saved as ``sworkflow.<device>.config``.

Available Commands
------------------

+---------------------+----------------------------------+
| Command             | Description                      |
+=====================+==================================+
| ``sw build <dev>``  | Build kernel for device          |
+---------------------+----------------------------------+
| ``sw init``         | Generate device configuration    |
+---------------------+----------------------------------+
| ``sw help``         | Display help message             |
+---------------------+----------------------------------+
| ``sw version``      | Display version                  |
+---------------------+----------------------------------+

Getting Help
------------

View the man page for detailed documentation::

    man sw

Or visit the `GitHub repository <https://github.com/sworkflow-project/sworkflow>`_.
