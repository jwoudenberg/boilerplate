# boilerplate

Opiononated project boilerplate in various languages, for starting personal projects.

To use this, clone the repo and run the shell script from a directory in which you would like to create a new project, passing the language to create boilerplate for.

```sh
$ ./boilerplate/init-project haskell
```

The script will prompt for the project name and description, then create a boilerplate directory.

## How it works

Each subdirectory in this repository contains boiler plate files. The following keywords used in file names and contents will be replaced during project generation:

- `project-name`
- `project_name`
- `ProjectName`
- `project-description`
- `project-year` (gets replaced with the current year)
