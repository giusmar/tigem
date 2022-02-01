#' Create count matrix
#'
#' @param x (character vector) With x you have do define the character vector in which each element is the name of out file created by features count.
#' @param ref (file) Ref is the file loaded with the function load_annotation of the same package.
#'
#' @return (data frame) It return a data frame that you can save as csv file.
#' @export
#'
#' @examples create_cm(file_list)
create_cm <- function(x, ref) {

  rmv <- function(x) gsub(".count.out", "", x)

  read_count <- function(x) {
    read.delim(paste0(here::here("data", "countTable/"), x), comment.char = "#") |>
      select(Geneid, matches("bam$")) |>
      rename_at(1, ~"gene_id") |>
      rename_at(2, ~rmv(x))
  }

  temp = x |>
    map(read_count)

  temp |>
    Reduce(f = function(x,y) merge(x = x,
                                   y = y,
                                   by = intersect(names(x),
                                                  names(y)))) |>
    merge(y = ref, by = 'gene_id' ) |>
    relocate(gene_id, gene_name)

}
