==========================================
sworkflow - Streamlined Kernel Compilation
==========================================

**sworkflow** (sw) is an automated kernel compilation tool designed to
streamline the process of compiling the Linux kernel and significantly
reduce the overhead involved in setting up the development environment.

Features
========

- Device-specific build configurations
- Cross-compiler management for ARM64/ARM32/x86
- Clang/LLVM build support
- DTBO image generation
- AnyKernel3 packaging integration
- Interactive config generation

Quick Start
===========

Install::

    git clone https://github.com/sworkflow-project/sworkflow.git
    cd sworkflow
    make install

Build a kernel::

    cd /path/to/kernel-source
    sw build mainline

Documentation
=============

.. toctree::
   :maxdepth: 2
   :caption: Getting Started

   content/installorremove
   tutorials/setup

.. toctree::
   :maxdepth: 2
   :caption: Reference

   content/project_structure

Links
=====

- `GitHub Repository <https://github.com/sworkflow-project/sworkflow>`_
- `Issue Tracker <https://github.com/sworkflow-project/issues/issues>`_
- `Releases <https://github.com/sworkflow-project/sworkflow/releases>`_

Indices and Tables
==================

* :ref:`search`
