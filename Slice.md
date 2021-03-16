Slice
	(A code for decomposing finite element meshes for running parallel analyses.)
	(Version: 0.9.99) Modified: 2021/03/10

usage: slice [options] file_to_split
	-help (Print this summary and exit)
	-in_type <$val> (File format for input mesh file (default = exodus))

	-processors <$val> (Number of processors to decompose the mesh for)
	-method <$val> (Decomposition method
		'linear'   : #elem/#proc to each processor
		'scattered': Shuffle elements to each processor (cyclic)
		'random'   : Random distribution of elements, maintains balance
		'rb'       : Metis multilevel recursive bisection
		'kway'     : Metis multilevel k-way graph partitioning
		'variable' : Read element-processor assignment from an element variable
		'map'      : Read element-processor assignment from an element map [processor_id]
		'file'     : Read element-processor assignment from file)
	-decomposition_name <$val> (The name of the element variable (method = `variable`)
		or element map (method = `map`) containing the element to processor mapping.
		If no name is specified, then `processor_id` will be used.
		If the name is followed by a ',' and an integer or 'auto', then
		the entries in the map will be divided by the integer value or
		(if auto) by `int((max_entry+1)/proc_count)`.)
	-decomposition_file <$val> (File containing element to processor mapping
		when decomposition method 'file' specified
		The file contains multiple lines, each line has 1 or 2 integers.
		If a single integer, it is the processor for the current element
		If two integers (count proc), they specify that the next
			'count' elements are on processor 'proc')
	-contiguous_decomposition (If the input mesh is contiguous, create contiguous decompositions)

	-output_path <$val> (Path to where decomposed files will be written.
		The string %P will be replaced with the processor count
		The string %M will be replaced with the decomposition method.
		Default is the location of the input mesh)

	-Partial_read_count <$val> (Split the coordinate and connectivity reads into a
		maximum of this many nodes or elements at a time to reduce memory.)
	-max-files <$val> (Specify maximum number of processor files to write at one time.
		Usually use default value; this is typically used for debugging.)

	-netcdf4 (Output database will be a netcdf4 hdf5-based file instead of the classical netcdf file format)
	-netcdf5 (Output database will be a netcdf5 (CDF5) file instead of the classical netcdf file format)
	-64-bit (Use 64-bit integers on output database)

	-shuffle (Use a netcdf4 hdf5-based file and use hdf5s shuffle mode with compression.)
	-zlib (Use the Zlib / libz compression method if compression is enabled (default) [exodus only].)
	-szip (Use SZip compression. [exodus only, enables netcdf-4])
	-compress <$val> (Specify the hdf5 compression level [0..9] to be used on the output file.)

	-debug <$val> (Debug level: 0, 1, 2, 4 or'd)
	-version (Print version and exit)
	-copyright (Show copyright and license data.)

	   Can also set options via SLICE_OPTIONS environment variable.

	->->-> Send email to gsjaardema@gmail.com for slice support.<-<-<-
