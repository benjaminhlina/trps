## ----include = FALSE-------------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE--------------------------------------------------------------------------------------------------------------------------------------------
{
library(bayesplot)
library(brms)
library(dplyr)
library(ggplot2)
library(ggdist)
library(grid)
library(purrr)
library(tidybayes)
library(tidyr)
library(trps)
library(viridis)
}

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
combined_iso

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
unique(combined_iso$common_name)

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
unique(combined_iso$ecoregion)

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
combined_iso_update <- combined_iso %>% 
  dplyr::select(-c(d13c_b2, d15n_b2, c2, n2)) %>% 
  mutate(
    l1 = 2, 
    name = paste(ecoregion, common_name, sep = "_")
  ) %>% 
  dplyr::select(id, common_name, ecoregion, name, d13c:l1)

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
combined_iso_update

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
m1 <- combined_iso_update %>% 
  split(.$name) %>% 
  map( ~ brm(
    formula = one_source_model(),
    prior = one_source_priors(),
    stanvars = one_source_priors_params(),
    data = .x,
    family = gaussian(),
    chains = 2,
    iter = 4000,
    warmup = 1000,
    cores = 4,
    seed = 4,
    control = list(adapt_delta = 0.95)
  ), 
  .progress = TRUE
  )

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
m1

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
m1 %>% 
  iwalk(~ {
    plot(.x) 
    grid.text(.y, x = 0.50, y = 0.98)
  })

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
m1

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
m1 %>% 
  map(~ .x %>% 
        pp_check()
  )

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
get_variables(m1[[1]])

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
post_draws_mg <- m1 %>%
  map(~ .x %>% 
        gather_draws(b_tp_Intercept) %>% 
        mutate(
          .variable = "tp"
        ) %>% 
        ungroup()
  ) %>% 
  bind_rows(.id = "name") %>% 
  separate_wider_delim(name, names = c("ecoregion", "common_name"), 
                       delim = "_", cols_remove = FALSE) %>% 
  mutate(
    ecoregion = factor(ecoregion, 
                       levels = c("Anthropogenic", "Embayment")), 
  )

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
post_draws_mg

## ----message=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------
post_medians_ci <- m1 %>%
  map(~ .x %>% 
        spread_draws(b_tp_Intercept) %>%
        median_qi() %>% 
        rename(
          tp = b_tp_Intercept
        ) 
  ) %>% 
  bind_rows(.id = "name") %>% 
  separate_wider_delim(name, names = c("ecoregion", "common_name"), 
                       delim = "_", cols_remove = FALSE) %>% 
  mutate(
    ecoregion = factor(ecoregion, 
                       levels = c("Anthropogenic", "Embayment")), 
  ) %>% 
  mutate_if(is.numeric, round, digits = 2)

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
post_medians_ci

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggplot(data = post_draws_mg, aes(x = common_name, 
                                 y = .value, 
                                 fill = ecoregion)) + 
  geom_violin() + 
  stat_summary(fun = median, geom = "point", 
               size = 3, 
               position = position_dodge(0.9)
  ) + 
  scale_fill_viridis_d(name = "Ecoregion", 
                       option = "G", 
                       begin = 0.35, 
                       end = 0.75, alpha = 0.65) + 
  theme_bw(base_size = 15) + 
  theme(
    panel.grid = element_blank(),
    legend.position = "inside", 
    legend.position.inside = c(0.85, 0.86)
  ) +
  labs(
    x = "Species", 
    y = "P(Trophic Position | X)"
  )

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
viridis_colours <- viridis(2,
                           option = "G",
                           begin = 0.35, 
                           end = 0.75, 
                           alpha = 0.65)

## --------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggplot(data = post_draws_mg, aes(x = common_name, 
                                 y = .value, 
                                 group = ecoregion)) + 
  stat_pointinterval(
    aes(point_fill = ecoregion),
    point_size = 4,
    interval_colour = "grey60",
    position = position_dodge(0.4),
    shape = 21,
  ) + 
  scale_fill_manual(aesthetics = "point_fill",
                    values = viridis_colours,
                    name = "Ecoregion") +
  theme_bw(base_size = 15) + 
  theme(
    panel.grid = element_blank(),
    legend.position = "inside", 
    legend.position.inside = c(0.85, 0.86)
  ) +
  labs(
    x = "Species", 
    y = "P(Trophic Position | X)"
  )

