#' Load annotation
#'
#' @param fname (char) fname is the path for the gtf file
#'
#' @return A dataframe in which are selected only gene_id and gene_name column
#' @export
#'
#' @examples load_annotation("$params.gtf")
load_annotation <- function(fname) {
  fname |>
    rtracklayer::import() |>
    base::as.data.frame() |>
    dplyr::select(gene_id, gene_name) |>
    dplyr::distinct()
}
