# IO_MODIFY Valid Commands

**HELP** _[list | assembly | graph | attribute | regex | glob]_

**END** | **EXIT**

> End command input and output changed assembly definitions (if any).

**QUIT**

> End command input and exit with no changes to database.

**ALLOW MODIFICATIONS**

>	By default, io\_modify will only allow creation of new assemblies.
		If this command is specified, then can modify assemblies that already exist in database.
		This will cause the database to be rewritten. Without this option, it is updated in place.

**LIST**

* LIST `elementblock|block|structuredblock|assembly|nodeset|sideset|blob|times|summary`
* LIST `elementblock|block|structuredblock|assembly|nodeset|sideset|blob {names...}`
* LIST `elementblock|block|structuredblock|assembly|nodeset|sideset|blob MATCHES {regex}`
* LIST `elementblock|block|structuredblock|assembly|nodeset|sideset|blob GLOB {glob}`

_For all commands, if an assembly named `name` does not exist, it will be created._

**ASSEMBLY {name}**
>	Creates an empty assembly named `name` if it does not exist.

**ASSEMBLY {name} ADD {name1} {name2} ... {nameL}**
>	Adds the specified entities to the assembly.  All entities must be the same type.

**ASSEMBLY {name} REMOVE {name1} {name2} ... {nameL}**
>	Removes the specified entities from the assembly.

**ASSEMBLY {name} TYPE {type} MATCHES {regex}**
> 	Adds the entities of the specified type to the assembly.
		All entities whose name matches the {regex} will be added.

**ASSEMBLY {name} TYPE {type} GLOB {glob}**
> 	Adds the entities of the specified type to the assembly.
		All entities whose name matches the {glob} will be added.

**ASSEMBLY {name} TYPE {type} NAMED {list of one or more names}**
> 	Adds the entities of the specified type to the assembly.
		All entities whose names are listed will be added.

**ASSEMBLY {name} TYPE {type} RANGE {id} TO {id} BY {step}**
> 	Adds the entities of the specified type to the assembly.
		All entities whose id matches the specified range will be added.
		No message will be output for ids not matching an entity.

**ASSEMBLY {name} TYPE {type} IDS {id}, {id2}, ..., {idL}**
> 	Adds the entities of the specified type to the assembly.
		All entities whose id matches an id in the list will be added.
		A warning message will be output if there is no entity with the requested id.

**DELETE {name}**
> 	Remove the assembly with the specified name.
		Currently only supported for assemblies created during this execution; not for assemblies
		existing on the input database.

**GRAPH OUTPUT [filename]**
>	Create a _dot_ input file with the structure of the assembly graph.
		File is named `filename` or defaults to `assembly.dot` if filename not given.

**GRAPH CHECK**
>	Check validity of assembly graph--are there any cycles.

* **ATTRIBUTE {ent\_name} ADD {att\_name} STRING {values...}**
* **ATTRIBUTE {ent\_name} ADD {att\_name} DOUBLE {values...}**
* **ATTRIBUTE {ent\_name} NAME {att\_name} INTEGER {values...}**

>	Add an attribute to the specified entity (`ent_name`).
	The attribute will be named `att_name` with value(s) `values...`
	Can also modify the values of an existing attribute.'

**ATTRIBUTE LIST {ent\_name...}**
> 	List attributes for the selected entities

**ATTRIBUTE {ent\_type} LIST**
> 	List attributes for all entities in the specified entity type

**ATTRIBUTE {ent\_type} MATCH {regex}**
>	List attributes for all entities in the specified entity type whose name matches the regex.

**ATTRIBUTE {ent\_type} GLOB {glob}**
> 	List attributes for all entities in the specified entity type whose name matches the glob.

**GEOMETRY**

* **GEOMETRY ROTATE** `{X|Y|Z} {angle}`
* **GEOMETRY SCALE**  `{x} {y} {z}`
* **GEOMETRY OFFSET** `{x} {y} {z}`
* **GEOMETRY ROTATE** `{ELEMENTBLOCKS|BLOCKS|ASSEMBLY} {names} {X|Y|Z} {angle}`
* **GEOMETRY SCALE**  `{ELEMENTBLOCKS|BLOCKS|ASSEMBLY} {names} {x} {y} {z}`
* **GEOMETRY OFFSET** `{ELEMENTBLOCKS|BLOCKS|ASSEMBLY} {names} {x} {y} {z}`

**TIME**

* **TIME SCALE** `{scale}`
 
	T\_out = T\_in * {scale}

* **TIME OFFSET** `{offset}`

	T\_out = T\_in + {offset}

### Regular Expression help 
(used in `ASSEMBLY MATCHES` and `LIST MATCHES` and `ATTRIBUTE LIST MATCHES` options)

* Supports "POSIX Extended Regular Expressions" syntax.
* See [https://www.regular-expressions.info/posix.html](https://www.regular-expressions.info/posix.html)
* QuickStart: [https://www.regular-expressions.info/quickstart.html](https://www.regular-expressions.info/quickstart.html)

### Glob help 
(used in `ASSEMBLY GLOB` and `LIST GLOB` and `ATTRIBUTE LIST GLOB` options)

* `?(pattern-list)`   Matches zero or one occurrence of the given patterns
* `*(pattern-list)`   Matches zero or more occurrences of the given patterns
* `+(pattern-list)`   Matches one or more occurrences of the given patterns
* `@(pattern-list)`   Matches one of the given patterns
* `!(pattern-list)`   Matches anything except one of the given patterns

### Glob Examples
* `block*`   : All names that start with 'block'
* `[A-Z]*`   : All names that start with a capital letter