# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

get_mu <- function(alpha, beta) {
    .Call('_coga_get_mu', PACKAGE = 'coga', alpha, beta)
}

get_mu2 <- function(alpha, beta) {
    .Call('_coga_get_mu2', PACKAGE = 'coga', alpha, beta)
}

get_mu3 <- function(alpha, beta) {
    .Call('_coga_get_mu3', PACKAGE = 'coga', alpha, beta)
}

get_A <- function(mu, mu2, mu3) {
    .Call('_coga_get_A', PACKAGE = 'coga', mu, mu2, mu3)
}

get_p_GNB <- function(A) {
    .Call('_coga_get_p_GNB', PACKAGE = 'coga', A)
}

get_b_GNB <- function(p, mu, mu2) {
    .Call('_coga_get_b_GNB', PACKAGE = 'coga', p, mu, mu2)
}

get_r_GNB <- function(mu, p, b) {
    .Call('_coga_get_r_GNB', PACKAGE = 'coga', mu, p, b)
}

get_p_NB <- function(mu, mu2) {
    .Call('_coga_get_p_NB', PACKAGE = 'coga', mu, mu2)
}

get_r_NB <- function(p, mu) {
    .Call('_coga_get_r_NB', PACKAGE = 'coga', p, mu)
}

GNB <- function(k, r, p, b, mu) {
    .Call('_coga_GNB', PACKAGE = 'coga', k, r, p, b, mu)
}

NB <- function(k, r, p) {
    .Call('_coga_NB', PACKAGE = 'coga', k, r, p)
}

dcoga_approx_nv <- function(x, alpha, beta) {
    .Call('_coga_dcoga_approx_nv', PACKAGE = 'coga', x, alpha, beta)
}

#' Convolution of Gamma distribuitons (Approximation Method)
#'
#' Density and distribution function of convolution of gamma distributions
#' are calculated based on approximation method from Barnabani(2017), which
#' gives us the approximate result and faster evaluation than \code{dcoga}
#' and \code{pcoga} during three or more variables case. **So, we recommend
#' these functions for three or more varibales case with approximate result.**
#'
#' @param x Quantiles.
#' @param shape Numerical vector of shape parameters for each gamma distributions,
#' all shape parameters should be larger than or equal to 0, with at least three
#' non-zero.
#' @param rate Numerical vector of rate parameters for each gamma distributions,
#' all rate parameters should be larger than 0.
#'
#' @references
#' Barnabani, M. (2017). An approximation to the convolution of gamma
#' distributions. Communications in Statistics - Simulation and Computation
#' 46(1), 331-343.
#'
#' @examples
#' ## Example 1: Correctness check
#' set.seed(123)
#' ## do grid
#' y <- rcoga(100000, c(3,4,5), c(2,3,4))
#' grid <- seq(0, 15, length.out=100)
#' ## calculate pdf and cdf
#' pdf <- dcoga_approx(grid, shape=c(3,4,5), rate=c(2,3,4))
#' cdf <- pcoga_approx(grid, shape=c(3,4,5), rate=c(2,3,4))
#'
#' ## plot pdf
#' plot(density(y), col="blue")
#' lines(grid, pdf, col="red")
#'
#' ## plot cdf
#' plot(ecdf(y), col="blue")
#' lines(grid, cdf, col="red")
#'
#' ## Example 2: Show parameter recycling
#' ## these pairs give us the same results
#' dcoga_approx(1:5, c(1, 2), c(1, 3, 4, 2, 5))
#' dcoga_approx(1:5, c(1, 2, 1, 2, 1), c(1, 3, 4, 2, 5))
#'
#' pcoga_approx(1:5, c(1, 3, 5, 2, 2), c(3, 5))
#' pcoga_approx(1:5, c(1, 3, 5, 2, 2), c(3, 5, 3, 5, 3))
#'
#' @author Chaoran Hu
#'
#' @export
dcoga_approx <- function(x, shape, rate) {
    .Call('_coga_dcoga_approx', PACKAGE = 'coga', x, shape, rate)
}

pcoga_approx_nv <- function(x, alpha, beta) {
    .Call('_coga_pcoga_approx_nv', PACKAGE = 'coga', x, alpha, beta)
}

#' @rdname dcoga_approx
#' @export
pcoga_approx <- function(x, shape, rate) {
    .Call('_coga_pcoga_approx', PACKAGE = 'coga', x, shape, rate)
}

dcoga2dim_nv <- function(x, shape1, shape2, rate1, rate2) {
    .Call('_coga_dcoga2dim_nv', PACKAGE = 'coga', x, shape1, shape2, rate1, rate2)
}

#' Convolution of Two Gamma Distributions (Exact Method).
#'
#' Density, and distribution function of convolution of *two* gamma
#' distributions. These two functions still give us the exact density and
#' distribution function value, but which are much faster than \code{dcoga}
#' and \code{pcoga}. **So, we recommend these two functions for two variables
#' case.** The algorithm of these two functions comes from Mathai, A.M. (1982).
#'
#' @param x Quantiles.
#' @param shape1,shape2 Shape parameters for the first and second gamma
#' distributions, both shape parameters should be larger than or equal to 0,
#' with at least one non-zero.
#' @param rate1,rate2 Rate parameters for the first and second gamma
#' distributions, both rate parameters should be larger than 0.
#'
#' @references
#' Mathai, A.M.: Storage capacity of a dam with gamma type inputs.
#' Ann. Inst. Statist.Math. 34, 591-597 (1982)
#'
#' @examples
#' ## Example 1: Correctness check
#' set.seed(123)
#' ## do grid
#' y <- rcoga(100000, c(3,4), c(2,3))
#' grid <- seq(0, 15, length.out=100)
#' ## calculate pdf and cdf
#' pdf <- dcoga2dim(grid, 3, 4, 2, 3)
#' cdf <- pcoga2dim(grid, 3, 4, 2, 3)
#'
#' ## plot pdf
#' plot(density(y), col="blue")
#' lines(grid, pdf, col="red")
#'
#' ## plot cdf
#' plot(ecdf(y), col="blue")
#' lines(grid, cdf, col="red")
#'
#' ## Example 2: Comparison with `dcoga` and `pcoga`
#' ## these pairs give us the same results
#' dcoga(1:5, c(1, 2), c(3, 4))
#' dcoga2dim(1:5, 1, 2, 3, 4)
#'
#' pcoga(1:5, c(1, 3), c(3, 5))
#' pcoga2dim(1:5, 1, 3, 3, 5)
#'
#' @author Chaoran Hu
#'
#' @export
dcoga2dim <- function(x, shape1, shape2, rate1, rate2) {
    .Call('_coga_dcoga2dim', PACKAGE = 'coga', x, shape1, shape2, rate1, rate2)
}

pcoga2dim_nv <- function(x, shape1, shape2, rate1, rate2) {
    .Call('_coga_pcoga2dim_nv', PACKAGE = 'coga', x, shape1, shape2, rate1, rate2)
}

#' @rdname dcoga2dim
#' @export
pcoga2dim <- function(x, shape1, shape2, rate1, rate2) {
    .Call('_coga_pcoga2dim', PACKAGE = 'coga', x, shape1, shape2, rate1, rate2)
}

#' Recurrence Identity of Shape Parameter for \code{pcoga2dim}
#'
#' The difference of distribution functions of convolution of two gamma
#' distributions between consecutive neighbors of shape parameter. This
#' function evaluate the value of 'pcoga2dim(x, shape1, shape2, rate1, rate2)
#' - pcoga2dim(x, shape1 + 1, shape2, rate1, rate2)' with higher efficiency
#' (this function is much more faster than call \code{pcoga2dim} two-times).
#'
#' @param x Quantiles.
#' @param shape1,shape2 Shape parameters of the first and second gamma
#' distributions, both shape parameters should be larger than or equal to 0.
#' @param rate1,rate2 Rate parameters of the first and second gamma
#' distributions, both rate parameters should be larger than 0.
#'
#' @examples
#' ## these pairs give us the same results
#' pcoga2dim_diff_shape(3,2,4,5,4)
#' pcoga2dim(3,2,4,5,4) - pcoga2dim(3,3,4,5,4)
#'
#' pcoga2dim_diff_shape(3,0,4,3,5)
#' pgamma(3,4,5) - pcoga2dim(3,1,4,3,5)
#'
#' pcoga2dim_diff_shape(3,6,0,5,4)
#' pgamma(3,6,5) - pgamma(3,7,5)
#'
#' pcoga2dim_diff_shape(3,0,0,4,5)
#' 1 - pgamma(3,1,4)
#'
#' @author Chaoran Hu
#'
#' @export
pcoga2dim_diff_shape <- function(x, shape1, shape2, rate1, rate2) {
    .Call('_coga_pcoga2dim_diff_shape', PACKAGE = 'coga', x, shape1, shape2, rate1, rate2)
}

#' Convolution of Gamma Distributions (Exact Method).
#'
#' Density, distribution function, and random generation for convolution
#' of gamma distributions. Convolution of independent Gamma random
#' variables is \eqn{Y = X_{1} + ... + X_{n}}, where \eqn{X_{i}, i = 1, ..., n},
#' are independent Gamma distributions with parameters shapes and rates.
#' The exact density function and distribution function can be calculated,
#' according to the formulas from Moschopoulos, Peter G. (1985).
#' **We mention that \code{dcoga} and \code{pcoga} are recommended
#' for \eqn{n >= 3}.**
#'
#' @param x Quantiles.
#' @param n Number of sample points.
#' @param shape Numerical vector of shape parameters for each gamma distributions,
#' all shape parameters should be larger than or equal to 0, with at least one
#' non-zero.
#' @param rate Numerical vector of rate parameters for each gamma distributions,
#' all rate parameters should be larger than 0.
#'
#' @references
#' Moschopoulos, Peter G. "The distribution of the sum of independent
#' gamma random variables." Annals of the Institute of
#' Statistical Mathematics 37.1 (1985): 541-544.
#'
#' @examples
#' ## Example 1: Correctness check
#' set.seed(123)
#' ## do grid
#' y <- rcoga(100000, c(3,4,5), c(2,3,4))
#' grid <- seq(0, 15, length.out=100)
#' ## calculate pdf and cdf
#' pdf <- dcoga(grid, shape=c(3,4,5), rate=c(2,3,4))
#' cdf <- pcoga(grid, shape=c(3,4,5), rate=c(2,3,4))
#'
#' ## plot pdf
#' plot(density(y), col="blue")
#' lines(grid, pdf, col="red")
#'
#' ## plot cdf
#' plot(ecdf(y), col="blue")
#' lines(grid, cdf, col="red")
#'
#' ## Example 2: Show parameter recycling
#' ## these pairs give us the same results
#' dcoga(1:5, c(1, 2), c(1, 3, 4, 2, 5))
#' dcoga(1:5, c(1, 2, 1, 2, 1), c(1, 3, 4, 2, 5))
#'
#' pcoga(1:5, c(1, 3, 5, 2, 2), c(3, 5))
#' pcoga(1:5, c(1, 3, 5, 2, 2), c(3, 5, 3, 5, 3))
#'
#' @author Chaoran Hu
#'
#' @export
dcoga <- function(x, shape, rate) {
    .Call('_coga_dcoga', PACKAGE = 'coga', x, shape, rate)
}

#' @rdname dcoga
#' @export
pcoga <- function(x, shape, rate) {
    .Call('_coga_pcoga', PACKAGE = 'coga', x, shape, rate)
}

salvo_integrand <- function(u, y, shape, scale) {
    .Call('_coga_salvo_integrand', PACKAGE = 'coga', u, y, shape, scale)
}

salvo_multi_comp <- function(y, shape, scale) {
    .Call('_coga_salvo_multi_comp', PACKAGE = 'coga', y, shape, scale)
}

# Register entry points for exported C++ functions
methods::setLoadAction(function(ns) {
    .Call('_coga_RcppExport_registerCCallable', PACKAGE = 'coga')
})
