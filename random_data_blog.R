## ------------------------------------------------------------------------
if (!require("pacman")) install.packages("pacman"); library(pacman)
p_load_gh("trinker/wakefield")

## ----, message=FALSE-----------------------------------------------------
race(n=10)
attributes(race(n=10))

## ------------------------------------------------------------------------
sex(10)
likert_7(10)
gpa(10)
dna(10)
string(10, length = 5)

## ------------------------------------------------------------------------
set.seed(10)

r_data_frame(
    n = 500,
    id,
    race,
    age,
    smokes,
	marital,
    Start = hour,
	End = hour,
    iq,
    height,
    died
)

## ------------------------------------------------------------------------
p_load(dplyr)
set.seed(10)

r_data_frame(
    n = 30,
    id,
    state,
    month,
    sat,
    minute,
    iq,
	zip_code,
	year,
    Scoring = rnorm,
    Smoker = valid,
	sentence
) %>%
    r_na(prob=.25)

## ------------------------------------------------------------------------
set.seed(10)

r_data(1000)

## ----, message=FALSE-----------------------------------------------------
p_load(dplyr)
set.seed(10)

dplyr::data_frame(
    x = 1:10,
	y = x + rnorm(10)
)

## ------------------------------------------------------------------------
set.seed(10)

dplyr::data_frame(
	ID = wakefield::id(n=10),
    Smokes = smokes(n=10),
	Sick = ifelse(Smokes, sample(5:10, 10, TRUE), sample(0:4, 10, TRUE)),	
	Death = ifelse(Smokes, sample(0:1, 10, TRUE, prob = c(.2, .8)), sample(0:1, 10, TRUE, prob = c(.7, .3)))
)

