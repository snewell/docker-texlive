texlive
=======
A set of Docker images to support working with latex.

snewell/texlive
---------------
This image is built using :code:`Dockerfile`.  It will create an image that
contains the latex packages and fonts that I use in my projects.  Since
installing all the fonts makes the image huge (over two gigabytes in my tests),
fonts are included by using :code:`fonts.txt`; I expect anybody using this
image to tweak that file for their needs.

This image also contains a
`cmake helper package <https://github.com/snewell/latex-cmake/>`_ for working
with latex documents.

This image can be used directly, but it's designed (not to mention more useful)
as a building component for other latex images.


snewell/texlive-local-user
--------------------------
This is an image used to create a build environment for a specific user.  The
expected use case looks something like this:

.. code:: bash

    $ docker build -t texlive-stephen -f Dockerfile.local_user  . \
        --build-arg USER_ID=$(id -u) \
        --build-arg GROUP_ID=$(id -g)

If all goes well, you'll have an image named :code:`textlive-stephen` that's
setup with his user and group IDs (assuming stephen actually ran :code:`docker build`).

Once built, the container can be launched with a command like the following:

.. code:: bash

    $ docker run -d \
        --name my_awesome_project \
        -v /home/stephen/tex:/tex:ro \
        -v /home/stephen/tex-build:/build \
        texlive-stephen sleep infinity

This will create a daemonized container you can connect to later, using a
command such as:

.. code:: bash

    $ docker exec -it my_awesome_project /bin/bash
    bash-5.0$ pwd
    /build
    bash-5.0$ ls
    CMakeCache.txt        cmake_install.cmake   test.pdf
    CMakeFiles            test.aux              test2.pdf_lualatex.1
    Makefile              test.log
    bash-5.0$ ls /tex/
    CMakeLists.txt  test.tex
    bash-5.0$

The files in :code:`/tex` and :code:`/build` will match the contents of your
volumes (see below for expected use cases).

Build Arguments
~~~~~~~~~~~~~~~
There are two build arguments, both of which are required:

* :code:`USER_ID` is the numeric ID the container's local user will be
  assigned.  You probably want this to match a specific user on your system.
* :code:`GROUP_ID` is the numberic ID the container's local group will be
  assigned.  Like :code:`USER_ID`, you want this to be the specific user's
  primary group ID.

Volumes
~~~~~~~
The following volumes are available:

* :code:`/tex` is designed to be a source directory where the tex files can
  live.  This lets you edit them using whatever local tooling you like instead
  of using the limited tools in the container.  It's expected, but not assumed
  or required, that this volume is read-only within the container.
* :code:`/build` is designed to an output directory for build artifcats.
