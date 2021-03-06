#' Helper function that samples from the empirical cumulative distribution function (ecdf)
#'
#' \code{impute} returns a vector of values imputed from sampling from the ecdf of \code{x}.
#'
#' @param x A vector.
#' @param n The number of values to impute.
#' @return The output of \code{impute_ecdf} is a vector of imputed values of length \code{n}
#' @export
#' @family imputers
#' @examples
#' x <- c(1, 2, 3, 4, 5, NA, NA)
#'
#' # Impute via ecdf sampling
#' x_impute <- impute(x, impute_ecdf)
#'
#' # Compare
#' data.frame(x, x_impute)

impute_ecdf <- function(x, n=1) {
    # Check x
    if (missing(x)) {
        stop("Please provide a vector x to use for ecdf sampling", call.=FALSE)
    } else if (any(is.na(x))) {
        stop("x cannot contain any NAs")
    }

    # Check n
    if (!is.numeric(n) || n < 1) {
        stop("n must be a positive integer", call.=FALSE)
    }
    n <- floor(n)

    # Derive ecdf
    x_ecdf <- ecdf(x)

    # Sample
    x_sample <- quantile(x, runif(n))

    # Return
    x_sample
}
