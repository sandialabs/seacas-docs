.. SEACAS documentation master file, created by
   sphinx-quickstart on Tue Mar  2 13:44:56 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


.. toctree::
   :maxdepth: 4
   :caption: Contents:
   

SEACAS
------

The Sandia National Laboratories (SNL) Engineering Analysis Code
Access System (SEACAS) is a collection of structural and thermal codes
and utilities used by analysts at SNL. The system includes pre- and
post-processing codes, analysis codes, database translation codes,
support libraries, UNIX shell scripts, and an installation system.

WIKI: FAQ and Extensions 
   The `SEACAS WIKI <https://github.com/gsjaardema/seacas/wiki>`_ contains some FAQ-like answers and also a listing of proposed Exodus extensions.

`Recent Changes <../../changes.html>`_
   Documents changes to the SEACAS applications and libraries that may not yet be covered in the documentation.

`Using SEACAS on Parallel Computers <../../Parallel_Instructions.pdf>`_
  Out-of-date, but some information is still useful.  Instructions to
  run the SEACAS/ACCESS system on Parallel computers. Currently
  specific to Sandia National Laboratories systems.

Exodus
------
Exodus is a model developed to store and retrieve data for finite
element analyses. It is used for preprocessing (problem definition),
postprocessing (results visualization), as well as code to code data
transfer. An Exodus data file is a random access, machine independent,
binary file that is written and read via C, C++, or Fortran library
routines which comprise the Application Programming Interface. Exodus
uses `NetCDF`_ as the on-disk storage format.

The new version includes support for names, nodeset variables, sideset
variables, named attributes, coordinate frames, concatenated element
block definition, optional multiple named node and element maps,
assemblies, blobs, and other cleanups.

* `Doxygen Documentation <../../html/index.html>`_
* `"New" API Documentation <../../exodusII-new.pdf>`_

**Element Types**
  A list of all element types supported by Exodus (and `IOSS`_) is
  provided in `Exodus Element Types <../../html/element_types.html>`_

**Full Model Topology**
  The API has also been modified to store the full model topology
  nodes->edges->faces->elements including blocks and sets of all
  entities. The API extensions are documented in Chapter 4 of
  `SAND2007-0525, A data storage model for novel partial differential
  equation discretizations <../../ExodusII-Addendum.pdf>`_.

**64 Bit Integers** 
  The API was modified in 2012 to permit the storage of more than 2.1
  Billion nodes and/or elements. The changes are documented in `64-bit
  integers <../../html/index.html#int64>`_

**Large File**
  Documentation of the modifications needed to use the "large-file"
  modifications which permit storage of models with more than ~30
  million elements is found in `Large Model <../../html/large_model.html>`_

**Polyhedral elements** 
  The documentation for this is in `Polyhedral Element Storage
  <../../html/polyhedra.html>`_
  
**Long Names** 
  The API now supports names longer (or shorter) than 32
  characters. The names include variable names and entity names. The
  changes are documented in `Long Names
  <../../html/index.html#db_options>`_.

**Nemesis**
  All nemesis functions have been added to the exodus API. In most
  cases, the name of the exodus function is the same as the original
  nemesis function except that the leading ``ne_`` has been replaced
  with ``ex_``.  There are a few exceptions.  See `Nemesis API Mapping
  <../../html/nemesis-mapping.html>`_ for a complete list of
  functions.

Exodus Python Interfaces
------------------------

* `Exodus Python Interface: <../../exodus.html>`_ Exodus.py, a python interface to the Exodus
  library. Python 2 and 3 versions available.
  

* `Exomerge Python Module: <../../exomerge.pdf>`_ ExoMerge.py, a lightweight python interface
  for manipulating Exodus files.  Python 2 and 3 versions available.
  

IOSS
---- 

IO System (IOSS) The `documentation <../../IOSystem.pdf>`_ is a
medium- to low-level view of the IO system (IOSS) targeted at
developers who will be adding or modifying the database IO portion of
the system. It should give enough detail that a new database type
could be added by reading this document and looking at an existing
database class. It is also helpful to have the doxygen-generated
documentation for the `IOSS class hierarchy <../../ioss_html/index.html>`_. 

The IO Subsystem has been designed to support multiple database
formats simultaneously. It is possible to have the finite element
model read from an Exodus database; two results files being written to
an Exodus file with a third results file being written to a CGNS file;
and the restart file being written to yet another Exodus file. Each of
these output databases can have a different schedule for when to write
and what data is to be written. `Ioss-exodus-mapping.pdf
<../../Ioss-exodus-mapping.pdf>`_ describes how an Exodus model is
mapped into the IOSS representation.

Chaco
-----

Graph partitioning is a fundamental problem in many scientific
contexts.  This document describes the capabilities and operation of
`Chaco 2.0 <../../chaco.pdf>`_, a software package designed to
partition graphs. Chaco 2.0 allows for recursive application of
several methods for finding small edge separators in weighted graphs
These methods include inertial, spectral, Kernighan-Lin, and
multilevel methods in addition to several simpler strategies Each of
these approaches can be used to partition the graph into two, four, or
eight pieces at each level of recursion In addition, the Kernighan-Lin
method can be used to improve partitions generated by any of the other
algorithms. Brief descriptions of these methods are provided along
with references to relevant literature. Chaco 2.0 can also be used to
address various graph sequencing problems, and this capability is
briefly described. The user interface input/output formats and
appropriate settings for a variety of code parameters are discussed in
detail and some suggestions on algorithm selection are offered.

.. note::
   NOTE: The ``short *assignment`` argument to the interface function has been changed to ``int
   *assignment`` to permit decompositions with more than 32,768 processors.

There are also now a ``CHACO_VERSION_MAJOR``, ``CHACO_VERSION_MINOR``, and
``CHACO_VERSION_PATCH`` defines in ``chaco.h``.

* `Chaco <../../chaco.pdf>`_

NetCDF
------
* NetCDF The netCDF software functions as an I/O library, callable
  from C or FORTRAN, which stores and retrieves data in
  self-describing, machine-independent files. Each netCDF file can
  contain an unlimited number of multi-dimensional, named variables
  (with differing types that include integers, reals, characters,
  bytes, etc.), and each variable may be accompanied by ancillary
  data, such as units of measure or descriptive text. The interface
  includes a method for appending data to existing netCDF files in
  prescribed ways, functionality that is not unlike a (fixed length)
  record structure. However, the netCDF library also allows
  direct-access storage and retrieval of data by variable name and
  index and therefore is useful only for disk-resident (or
  memory-resident) files.  NetCDF information is available from
  Unidata.

  Man pages for the ncgen and ncdump utilities are also
  available. (These can be used to convert an exodus file from/to a
  text representation.)

Nemesis
-------

The `Nemesis <../../Nemesis_Users_Guide.pdf>`_ library is an
enhancement to the Exodus finite element database model used to store
and retrieve data for unstructured parallel finite element
analyses. NEMESIS I adds data structures which facilitate the
partitioning of a scalar (standard serial) Exodus file onto parallel
disk systems found on many parallel computers. Since the NEMESIS I
application programming interface (API) can be used to append
information to an existing Exodus database, any existing software that
reads Exodus files can be used on files which contain NEMESIS I
information. The NEMESIS I information is written and read via C or
C++ callable functions which compromise the NEMESIS I API.  

* All nemesis functions have been added to the exodus API. In most
  cases, the name of the exodus function is the same as the original
  nemesis function except that the leading ``ne_`` has been replaced
  with ``ex_``. There are a few exceptions. See `Nemesis-To-Exodus-API-Mapping.md
  <../../Nemesis-To-Exodus-API-Mapping.md>`_ for a complete list of
  functions.

* `Fortran to C Function Mapping <../../nemesis-to-exodus-api-mapping.md>`_

SUPES
-----

The `SUPES <../../supes.pdf>_` library is a collection of subprograms
which perform frequently used non-numerical services for the
engineering applications programmer using FORTRAN-77. The three
functional categories of SUPES are: (1) input command parsing, (2)
dynamic memory management, and (3) system dependent utilities. The
subprograms in categories one and two are written in standard
FORTRAN-77, while the subprograms in category three are written to
provide a standardized FORTRAN interface to several system dependent
features.

Algebra
-------

`Algebra <../../algebra.pdf>`_ allows the user to manipulate data from
a finite element analysis before it is plotted. The finite element
output data is in the form of variable values (e.g., stress, strain,
and velocity components) in an Exodus database. The ALGEBRA program
evaluates user-supplied functions of the data and writes the results
to an output Exodus database which can be read by plot programs.

Aprepro
-------

`Aprepro <../../aprepro.pdf>`_ is an algebraic preprocessor that reads
a file containing both general text and algebraic, string, or
conditional expressions. It interprets the expressions and outputs
them to the output file along with the general text. Aprepro contains
several mathematical functions, string functions, and flow control
constructs. In addition, functions are included that, with some
additional files, implement a units conversion system and a material
database lookup system.

Blot
----

`Blot <../../blot.pdf>`_ is a graphics program for post-processing of
finite element analyses output in the Exodus database format. BLOT
produces mesh plots with various representations of the analysis
output variables. The major mesh plot capabilities are deformed mesh
plots, line contours, filled (painted) contours, vector plots of
two/three variables (e.g., velocity vectors), and symbol plots of
scalar variables (e.g., discrete cracks). Pathlines of analysis
variables can also be drawn on the mesh. BLOT's features include
element selection by material, element birth and death, multiple views
for combining several displays on each plot, symmetry mirroring, and
node and element numbering. BLOT can also produce X-Y curve plots of
the analysis variables. BLOT generates time-versus-variable plots or
variable-versus-variable plots. It also generates
distance-versus-variable plots at selected time steps where the
distance is the accumulated distance between pairs of nodes or element
centers.

CGNS_Decomp
-----------

Conjoin
-------

`Conjoin <../../exo_util.pdf>`_ joins two or more Exodus databases
into a single database. The input databases should represent the same
model geometry with similar variables. The output database will
contain the model geometry and all of the non-temporally-overlapping
results data. If two databases have overlapping timestep ranges, the
timesteps from the later database will be used. For example, if the
first database contains time data from 0 to 5 seconds, and the second
database contains time data from 4 to 10 seconds; the output database
will contain time data from 0 to 4 seconds from the first database and
time data from 4 to 10 seconds from the second database. If two nodes
have the same global id and are also collocated, then they are combined
to a single node in the output. Similarly, elements with the same
global id and the same nodal connectivity are combined into a single
element in the output file.  The output database will contain the
union of the meta and bulk data entities (i.e., nodes, elements,
element blocks, sidesets, and nodesets) from each input database. The
existence of an entity at a particular timestep is indicated via a
status variable. Replaces conex

Decomp
------

A script which calls nem_slice and nem_spread to decompose an Exodus
database for use in a parallel application which uses a file-per-rank
method for the input mesh database.

EJoin
-----

`EJoin  <../../exo_util.pdf>`_ is used to join two or more Exodus databases into a single
Exodus database. The input databases must have disjoint meta and bulk
data. That is: element blocks are not combined in the output
model. Each element block in each input file will produce an element
block in the output file. Similarly for nodesets and sidesets.  Each
node in each input file will produce a node in the output file unless
one of the node matching options (-match node ids or -match node
coordinates) is specified.  Each element in each input file will
produce an element in the output file. Elements are never combined
even if all of the nodes on two elements are combined, the output file
would have two elements with identical connectivity which is usually
not desired.  If any of the input databases have timesteps, then the
timestep values and counts must match on all databases with timesteps.

EPU
---

`EPU <../../exo_util.pdf>`_ combines multiple Exodus databases
produced by a parallel application into a single Exodus
database. Replaces nem_join.  One of the typical processes for
performing parallel analyses with Exodus databases is to decompose the
finite element model into multiple pieces such that each processor can
read and write its own portion of the finite element model and results
data. For example, if a parallel analysis is to be run on the mesh
file mesh.g using 8 processors, then mesh.g will be decomposed into 8
pieces or submeshes: mesh.g.8.0, mesh.g.8.1, . . ., mesh.g.8.7. Each
submesh will contain a subset of the nodes and elements of the entire
mesh and some communication data indicating which nodes and elements
are on the boundary of this submesh and the submesh of one or more
other processors.

The analysis code is then executed in parallel and each processor
reads its portion of the mesh from its respective submesh; when it
outputs results and/or restart data, it creates a new file containing
its portion of the submesh and the results that are calculated on that
submesh. An "N" processor run will create "N" separate files for each
results and/or restart "dataset" that it creates.

The analyst may want to visualize or postprocess the data in the
submeshes as a single mesh, so each submesh needs to be joined
together to create a single "global" file containing all of the data.1

This joining together of parallel submeshes is the purpose of EPU. It
will read the data from each submesh and map it into the correct
location in the "global" file; discarding duplicate data as required.

Exo_Format
----------

Exo_format gives information on the internal information of an exodus
file including the integer and floating point size, the name length,
and the underlying variant of the netCDF file.

The command ``exo_format --config`` will report on the third-party
library versions that the Exodus library was configured with.

Exo2Mat
-------
Exo2Mat	See `Mat2Exo`_ documentation.

Exodiff
-------

`Exodiff <../../exo_util.pdf>`_ compares the results data from two Exodus databases. The
databases should represent the same model, that is, the Ex odus meta
data should be identical as should be the Exodus portion of the bulk
data. The only differences should be in the values of the transient
bulk data. Exodiff's main purpose is to detect and report these
differences. Exodiff will compare global, nodal, element, nodeset, and
sideset transient variables at each selected timestep; it will also
compare element attribute variables on each element block containing
attributes.

Exomatlab
---------
ExoMatLab outputs selected global data to a text matlab file.

Exotxt
------

Exotxt converts an exodus file into a text file which can be edited or
used as input to other processing codes that need a text format. Can
be converted back to exodus using `TxtExo`_. (The netCDF utilities
ncdump/ncgen can also be used to convert an exodus files to/from
text.)

Fastq
-----

`FASTQ <../../FASTQ.pdf>`_ is an interactive two-dimensional finite element mesh generation
program, It is designed to provide a powerful and efficient tool to
both reduce the time required of an analyst to generate a mesh, and to
improve the capacity to generate good meshes in arbitrary
geometries. It is based on a mapping technique and employs a set of
"higher-order" primitives which have been developed for automatic
meshing of commonly encountered shapes (i.e. the triangle,
semi-circle, etc.) and conditions (i.e. mesh transitioning from coarse
to fine mesh size. ) FASTQ has been designed to allow user flexibility
and control. The user interface is built on a layered . command level
structure. Multiple utilities rue provided for input, manipulation,
and display of the geometric information, as well as for direct
control, adjustment, and display of the generated mesh. Enhanced
boundary flagging has been incorporated and multiple element types and
output formats are supported.

Memos documenting features (such as paving) not discussed in the sand report are available here

Gen3D
-----

`Gen3D <../../Gen3d.pdf>`_ is a three-dimensional mesh generation program. The
three-dimensional mesh is generated by mapping a two-dimensional mesh
into three-dimensions according to one of four types of
transformations: translating, rotating, mapping onto a spherical
surface, and mapping onto a cylindrical surface. The generated
three-dimensional mesh can then be reoriented by offsetting,
reflecting about an axis, and revolving about an axis. GEN3D can be
used to mesh geometries that are axisymmetric or planar, but, due to
three-dimensional loading or boundary conditions, require a
three-dimensional finite element mesh and analysis. More importantly,
it can be used to mesh complex three-dimensional geometries composed
of several sections when the sections can be defined in terms of
transformations of two-dimensional geometries.

Additional commands not documented in the main report are available here

GenShell
--------

`GenShell <../../GenShell.pdf>`_ is a three-dimensional shell mesh generation program. The
three-dimensional shell mesh is generated by mapping a two-dimensional
quadrilateral mesh into three dimensions according to one of several
types of transformations: translation, mapping onto a spherical,
ellipsoidal, or cylindrical surface, and mapping onto a user-defined
spline surface. The generated three-dimensional mesh can then be
reoriented by offsetting, reflecting about an axis, revolving about an
axis, and scaling the coordinates. GENSHELL can be used to mesh
complex three-dimensional geometries composed of several sections when
the sections can be defined in terms of transformations of
two-dimensional geometries.

GJoin
-----

`GJoin <../../gjoin.pdf>`_ is a two- or three-dimensional mesh combination program. GJOIN
combines two or more meshes written in the Exodus mesh database
format into a single Exodus mesh. Selected nodes in the two meshes
that are closer than a specified distance can be combined The geometry
of the mesh databases can be modified by scaling, offsetting,
revolving, and mirroring. The combined meshes can be further modified
by deleting, renaming, or combining material blocks, sideset
identifications, or nodeset identifications.

Grepos
------

`Grepos <../../grepos.pdf>`_ is a mesh utility program that repositions or modifies the
configuration of a two-dimensional or three-dimensional mesh. GREPOS
can be used to change the orientation and size of a two-dimensional or
three-dimensional mesh; change the material block, nodeset, and
sideset IDs; or "explode" the mesh to facilitate viewing of the
various parts of the model.

Explore
-------

`Explore <../../explore.pdf>`_ is a program that examines the input to a finite element
analysis or the output from an analysis in the Exodus database
format. EXPLORE allows the user to examine any value in the
database. The display can be directed to the user's terminal or to a
print file.

IO_Shell
--------

IO_Info
-------

IO_Modify
---------

Mapvar
------

.. note::
   NOTE: MAPVAR is buggy and cannot correctly handle the mapping of
   nodal variables in a mesh with multiple element blocks and multiple
   timesteps. It should work OK if there is only a single timestep;
   however, there may be an issue with nodes shared between multiple
   element blocks. Element variable interpolation should be OK in all
   cases.

`Mapvar  <../../mapvar.pdf>`_ is designed to transfer solution results from one
finite element mesh to another. MAPVAR draws heavily from the
structure and coding of MERLIN II, but it employs a new finite element
data base, Exodus, and offers enhanced speed and new capabilities
not available in MERLIN II. In keeping with the MERLIN II
documentation, the computational algorithms used in MAPVAR are
described. User instructions are presented. Example problems are
included to demonstrate the operation of the code and the effects of
various input options.

Mapvar-kd --------- 

.. note::
   NOTE: MAPVAR is buggy and cannot correctly handle the mapping of
   nodal variables in a mesh with multiple element blocks and multiple
   timesteps. It should work OK if there is only a single timestep;
   however, there may be an issue with nodes shared between multiple
   element blocks. Element variable interpolation should be OK in all
   cases.

`Mapvar-kd <../../mapvar.pdf>`_ is almost exactly the same as mapvar except that it uses a
KD algorithm for the internal search. It is much faster than mapvar in
certain situations, and should never be slower.

Mat2Exo
-------

`Mat2Exo <../../mat2exo.pdf>`_ is a program which translates mesh data from Matlab mat-file
format to Exodus format. This tool is the inverse of the commonly used
tool `Exo2Mat`_ which translates Exodus data to the Matlab mat-file
format. These tools provide a means for preprocessing an Exodus model
file or post-processing an Exodus results file using Matlab.

Nas2Exo
-------

Convert Nastran format to Exodus database.

nem_join
--------
.. deprecated::
   Use `EPU`_ instead.

nem_slice
---------

`nem_slice <../../nem_slice.pdf>`_ reads in a FEM description of the geometry of a problem from
an Exodus file and generates either a nodal or elemental graph of the
problem, calls `Chaco`_ to load balance the graph, and outputs a `Nemesis`_
load-balance file which can be read by

nem_spread
----------

`Nem_spread <../../nem_spread.pdf>`_ reads it's input command file (default name
``nem_spread.inp``), takes the named Exodus and spreads out the geometry
(and optionally results) contained in that file out to a parallel disk
system. The decomposition is taken from a scalar Nemesis load balance
file generated by the companion utility `nem_slice`_. Here is an `example
nem_spread input file <../../nem_spread.inp.pdf>`_.

Numbers
-------

`Numbers <../../numbers.pdf>`_ is a program which reads and stores data from a finite element
model described in the Exodus database format. Within this program are
several utility routines which calculate information about the finite
element model. It is limited to models with hexahedral elements only.

Slice
-----

Decompose an Exodus Database into multiple databases for use in a
parallel application which uses a file-per-rank method for the input
mesh database. Experimental.

Skinner
-------

Create an Exodus mesh consisting of the _skin_ or surface of the input Exodus database.

Struc_To_Unstruc
----------------

TxtExo
------

Txtexo converts a text file written by `ExoTxt`_ back to an exodus
file. (The netCDF utilities ncdump/ncgen can also be used to convert
an exodus files to/from text.)

Zellij
------

`Zellij <../../zellij/html/md__zellij.html>`_ takes 1 or more "unit cell" template databases and tiles them
into a single output database. The unit cells must have a structured
boundary on the I-J faces; the K face can have an arbitrary mesh as
can the interior of the unit cells. A lattice file is parsed to
specify the unit cells and their arrangement into the output
database. The output file can be written in a decomposed
"file-per-rank" set of files for using with a parallel
application. Zellij is optimized for large files. 

