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
    utils::read.delim(
      base::paste0(
        here::here("data", "countTable/"), x),
      comment.char = "#"
      ) |>
      dplyr::select(Geneid, matches("bam$")) |>
      dplyr::rename_at(1, ~"gene_id") |>
      dplyr::rename_at(2, ~rmv(x))
  }

  temp = x |>
    purrr::map(read_count)

  temp |>
    Reduce(f = function(x,y) base::merge(x = x,
                                   y = y,
                                   by = base::intersect(base::names(x),
                                                  base::names(y)))) |>
    base::merge(y = ref,
                by = 'gene_id' ) |>
    dplyr::relocate(gene_id, gene_name)

}
