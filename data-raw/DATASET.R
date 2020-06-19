library(tidyverse)

iso639_raw <- read_csv("data-raw/iso-639.csv", col_types = cols(.default = "c"))

iso639 <- iso639_raw %>%
  separate(
    iso639_2,
    into = c("iso639_2_bibliographic", "iso639_2_terminology"),
    sep = "\n",
    fill = "right"
  ) %>%
  mutate(iso639_2_terminology = case_when(
    is.na(iso639_2_terminology) ~ iso639_2_bibliographic,
    TRUE ~ iso639_2_terminology
  )) %>%
  mutate(across(starts_with("iso639_2"), ~ gsub(" \\([B|T]\\)", "", .))) %>%
  mutate(iso639_2 = iso639_2_terminology, .before = "iso639_2_bibliographic") %>%
  relocate(iso639_1, .before = "iso639_2")

usethis::use_data(iso639, overwrite = TRUE)
