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
                         "c2",
                         "dn",
                         "dn_sigma",
                         "sigma_lb",
                         "sigma_ub", "tp_lb",
                         "tp_ub",
                         "c1_mean",
                         "c2_mean", "n2",
                         "n2_sigma",
                         "a",
                         "b"))
