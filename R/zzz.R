.onAttach <- function(libname, pkgname) {
  packageStartupMessage("version 0.1.0 ('xc-ski-time').\nHave you loaded {brms}?")
}
utils::globalVariables(c("n1",
                         "n1_sigma",
                         "normal",
                         "uniform",
                         "alpha",
                         "min_alpha",
                         "max_alpha",
                         "d13c",
                         "c1",
                         "c2"))
