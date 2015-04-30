## ----, echo=FALSE--------------------------------------------------------
out_type <- knitr::opts_knit$get("rmarkdown.pandoc.to")

## ----, echo=FALSE--------------------------------------------------------
if (!require("pacman")) install.packages("pacman"); library(pacman)
p_load(dplyr, wakefield)

## ----, eval=FALSE--------------------------------------------------------
## if (!require("pacman")) install.packages("pacman"); library(pacman)
## p_install_gh("trinker/wakefield")
## p_load(dplyr, wakefield)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(n = 30,
    id,
    race,
    age(x = 8:14),
    Gender = sex,
    Time = hour,
    iq,
    grade, 
    height(mean=50, sd = 10),
    died,
    Scoring = rnorm,
    Smoker = valid
)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(
    n = 500,
    id,
    age, age, age,
    grade, grade, grade
)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    sex,
    r_series(gpa, 2),
    r_series(likert, 3, name = "Question")
)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    sex,
    political
)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    r_dummy(sex, prefix = TRUE),
    r_dummy(political)
)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(5,
    id, 
    r_series(likert, j = 4, name = "Item")
)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(5,
    id, 
    r_series(likert, j = 4, name = "Item")
) %>% 
    as_integer(-1)

## ------------------------------------------------------------------------
r_data_frame(100,
    id, 
    name,
    sex,
    sentence    
)

## ------------------------------------------------------------------------
r_data_frame(100,
    id, 
    name,
    sex,
    sentence    
) %>% peek

## ----, fig.height=7, fig.width=11----------------------------------------
set.seed(10)

r_data_frame(n=100,
    id,
    dob,
    animal,
    grade, grade,
    death,
    dummy,
    grade_letter,
    gender,
    paragraph,
    sentence
) %>%
   r_na() %>%
   plot(palette = "Set1")

## ----, results='asis', echo=FALSE, comment=NA, warning=FALSE, htmlcap="Available Variable Functions"----
p_load(pander, xtable)

switch(out_type,
    html = {variables("matrix", ncol=5) %>%
                xtable() %>%
                print(type = 'html', include.colnames = FALSE, include.rownames = FALSE,
                html.table.attributes = '')
           },
    latex = {variables("matrix", ncol=6) %>%
                xtable() %>%
                print(include.colnames = FALSE, include.rownames = FALSE, table.placement="!h")
            }
)
#matrix(c(sprintf("`%s`", vect), blanks), ncol=4) %>%
#    pandoc.table(format = "markdown", caption = "Available variable functions.")

## ------------------------------------------------------------------------
dat <- r_data_frame(120,
    id, 
    sex,
    age,
    r_series(likert, 15, name = "Item")
) %>% 
    as_integer(-c(1:3))

dat %>%
    select(contains("Item")) %>%
    cor %>%
    heatmap

## ----eval=FALSE----------------------------------------------------------
## student_id <- ## INSERT YOUT ID HERE
## 
## set.seed(student_id)
## 
## dat <- function(1000,
##     id,
##     gender,
##     religion,
##     internet_browser,
##     language,
##     iq,
##     sat,
##     smokes
## )

## ------------------------------------------------------------------------
variables(TRUE)

## ----, eval=FALSE--------------------------------------------------------
## r_data_frame(8,
##     name,
##     sex,
##     r_series(iq, 3)
## ) %>%
##     peek %>%
##     dput

