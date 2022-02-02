# Tigem package

This is a repo in which we have created a R package names tigem.

You can install it on your machine firstly installing devtools and next using the function install_github of the previous package.

```
#install.packages("devtools)
devtools::install_github("giusmar/tigem")
```

## Function

Below you can find a little decription of alla function of tigem package.

### load annotation

__usage__: tigem::load_annotation(fname)

With this function you will be able to load the gtf file and obtain in output a dataframe with only the gene_id and gene_name column.

### create count matrix

__usage__: tigem::create_cm(x, ref, path)

This function allows you to create a count matrix staring from the loaded gtf file and all .out files created from features count by a nextflow pipeline or alredy stored in you local machine. First you have to create a variable in which you have to define the location of .out files, and this is the argument path for the function. Ref is the gtf file loaded with the load annotation function of the same package. X is the character vector in wich are stored all the names of .out files: each element to each file.