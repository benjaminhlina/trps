// generated with brms 2.23.0
functions {
}
data {
  int<lower=1> N;  // total number of observations
  int<lower=1> N_alpha;  // number of observations
  vector[N_alpha] Y_alpha;  // response variable
  int<lower=1> K_alpha_ar;  // number of population-level effects
  matrix[N_alpha, K_alpha_ar] X_alpha_ar;  // population-level design matrix
  // covariates for non-linear functions
  vector[N_alpha] C_alpha_1;
  vector[N_alpha] C_alpha_2;
  int<lower=1> N_d15n;  // number of observations
  vector[N_d15n] Y_d15n;  // response variable
  int<lower=1> K_d15n_ar;  // number of population-level effects
  matrix[N_d15n, K_d15n_ar] X_d15n_ar;  // population-level design matrix
  int<lower=1> K_d15n_tp;  // number of population-level effects
  matrix[N_d15n, K_d15n_tp] X_d15n_tp;  // population-level design matrix
  int<lower=1> K_d15n_dn;  // number of population-level effects
  matrix[N_d15n, K_d15n_dn] X_d15n_dn;  // population-level design matrix
  // covariates for non-linear functions
  vector[N_d15n] C_d15n_1;
  vector[N_d15n] C_d15n_2;
  vector[N_d15n] C_d15n_3;
  int<lower=1> nresp;  // number of responses
  int nrescor;  // number of residual correlations
  int prior_only;  // should the likelihood be ignored?
}
transformed data {
  array[N] vector[nresp] Y;  // response array
  for (n in 1:N) {
    Y[n] = transpose([Y_alpha[n], Y_d15n[n]]);
  }
}
parameters {
  vector[K_alpha_ar] b_alpha_ar;  // regression coefficients
  real<lower=0> sigma_alpha;  // dispersion parameter
  vector[K_d15n_ar] b_d15n_ar;  // regression coefficients
  vector[K_d15n_tp] b_d15n_tp;  // regression coefficients
  vector[K_d15n_dn] b_d15n_dn;  // regression coefficients
  real<lower=0> sigma_d15n;  // dispersion parameter
  cholesky_factor_corr[nresp] Lrescor;  // parameters for multivariate linear models
}
transformed parameters {
  // prior contributions to the log posterior
  real lprior = 0;
  lprior += student_t_lpdf(sigma_alpha | 3, 0, 2.5)
    - 1 * student_t_lccdf(0 | 3, 0, 2.5);
  lprior += student_t_lpdf(sigma_d15n | 3, 0, 2.5)
    - 1 * student_t_lccdf(0 | 3, 0, 2.5);
  lprior += lkj_corr_cholesky_lpdf(Lrescor | 1);
}
model {
  // likelihood including constants
  if (!prior_only) {
    // initialize linear predictor term
    vector[N_alpha] nlp_alpha_ar = rep_vector(0.0, N_alpha);
    // initialize non-linear predictor term
    vector[N_alpha] mu_alpha;
    // initialize linear predictor term
    vector[N_d15n] nlp_d15n_ar = rep_vector(0.0, N_d15n);
    // initialize linear predictor term
    vector[N_d15n] nlp_d15n_tp = rep_vector(0.0, N_d15n);
    // initialize linear predictor term
    vector[N_d15n] nlp_d15n_dn = rep_vector(0.0, N_d15n);
    // initialize non-linear predictor term
    vector[N_d15n] mu_d15n;
    // multivariate predictor array
    array[N] vector[nresp] Mu;
    vector[nresp] sigma = transpose([sigma_alpha, sigma_d15n]);
    // cholesky factor of residual covariance matrix
    matrix[nresp, nresp] LSigma = diag_pre_multiply(sigma, Lrescor);
    nlp_alpha_ar += X_alpha_ar * b_alpha_ar;
    nlp_d15n_ar += X_d15n_ar * b_d15n_ar;
    nlp_d15n_tp += X_d15n_tp * b_d15n_tp;
    nlp_d15n_dn += X_d15n_dn * b_d15n_dn;
    for (n in 1:N_alpha) {
      // compute non-linear predictor values
      mu_alpha[n] = (nlp_alpha_ar[n] * (C_alpha_1[n] - C_alpha_2[n]) + C_alpha_2[n]);
    }
    for (n in 1:N_d15n) {
      // compute non-linear predictor values
      mu_d15n[n] = (nlp_d15n_dn[n] * (nlp_d15n_tp[n] - C_d15n_1[n]) + C_d15n_2[n] * nlp_d15n_ar[n] + C_d15n_3[n] * (1 - nlp_d15n_ar[n]));
    }
    // combine univariate parameters
    for (n in 1:N) {
      Mu[n] = transpose([mu_alpha[n], mu_d15n[n]]);
    }
    target += multi_normal_cholesky_lpdf(Y | Mu, LSigma);
  }
  // priors including constants
  target += lprior;
}
generated quantities {
  // residual correlations
  corr_matrix[nresp] Rescor = multiply_lower_tri_self_transpose(Lrescor);
  vector<lower=-1,upper=1>[nrescor] rescor;
  // extract upper diagonal of correlation matrix
  for (k in 1:nresp) {
    for (j in 1:(k - 1)) {
      rescor[choose(k - 1, 2) + j] = Rescor[j, k];
    }
  }
}

