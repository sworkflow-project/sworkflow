========================
Install or Remove ``sw``
========================

Dependencies
------------

**Required:**

- bash (>= 4.0)
- python3
- git
- make

**Recommended (for kernel building):**

- build-essential
- bc, flex, bison
- libssl-dev, libelf-dev

**Optional:**

- clang (for LLVM builds)
- device-tree-compiler (for DTBO)

On Debian/Ubuntu::

    sudo apt-get install bash python3 git make build-essential bc flex bison libssl-dev libelf-dev

Install
-------

From Debian Package (Recommended)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Download the latest ``.deb`` from `Releases <https://github.com/sworkflow-project/sworkflow/releases>`_::

    sudo dpkg -i sworkflow_*.deb
    sudo apt-get install -f  # Install dependencies if needed

From Source (User Install)
~~~~~~~~~~~~~~~~~~~~~~~~~~

Installs to ``~/.local/`` - no root required::

    git clone https://github.com/sworkflow-project/sworkflow.git
    cd sworkflow
    make install

Ensure ``~/.local/bin`` is in your PATH::

    export PATH="$HOME/.local/bin:$PATH"

Add this line to your ``~/.bashrc`` to make it permanent.

From Source (System-wide)
~~~~~~~~~~~~~~~~~~~~~~~~~

Installs to ``/usr/``::

    git clone https://github.com/sworkflow-project/sworkflow.git
    cd sworkflow
    sudo make install

Verify Installation
~~~~~~~~~~~~~~~~~~~

To check if the installation was successful::

    sw version
    sw help

Uninstall
---------

User Installation
~~~~~~~~~~~~~~~~~

::

    make uninstall

System Installation
~~~~~~~~~~~~~~~~~~~

::

    sudo make uninstall

Debian Package
~~~~~~~~~~~~~~

::

    sudo apt-get remove sworkflow
