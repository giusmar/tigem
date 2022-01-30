#' Load annotation
#'
#' @param fname
#'
#' @return
#' @export
#'
#' @examples
load_annotation <- function(fname) {
  fname |>
    rtracklayer::import() |>
    base::as.data.frame() |>
    dplyr::select(gene_id, gene_name) |>
    dplyr::distinct()
}
