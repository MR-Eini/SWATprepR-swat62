test_that('table reader retains newly named trailing fields', {
  dir <- tempfile()
  dir.create(dir)
  writeLines(c('title', 'id old new_field', '1 value future'), file.path(dir, 'input.tbl'))
  read <- getFromNamespace('read_tbl', 'SWATprepR')
  x <- read('input.tbl', dir)
  expect_named(x, c('id','old','new_field'))
  expect_identical(x$new_field, 'future')
})

test_that('atmospheric deposition sources are explicit and year-specific', {
  resolve <- getFromNamespace('resolve_atmo_dep_sources', 'SWATprepR')
  expect_error(resolve(NULL, 2004:2005, 'year'), 'not stable')
  expect_identical(
    unname(resolve('input/{timestep}/dep-{year}.nc', 2004:2005, 'year')),
    c('input/year/dep-2004.nc', 'input/year/dep-2005.nc'))
  expect_identical(
    resolve(function(year, timestep) paste(timestep, year), 2004:2005, 'month'),
    c('month 2004', 'month 2005'))
})

test_that('official EMEP 2025 Reporting URLs match the published catalog', {
  expect_identical(
    emep_2025_netcdf_source(2004, 'year'),
    paste0('https://thredds.met.no/thredds/dodsC/data/EMEP/2025_Reporting/',
           'EMEP01_rv5.6_year.2004met_2004emis_rep2025.nc'))
  expect_identical(
    emep_2025_netcdf_source(2023, 'month'),
    paste0('https://thredds.met.no/thredds/dodsC/data/EMEP/2025_Reporting/',
           'EMEP01_rv5.6_month.2023met_2023emis.nc'))
  expect_identical(
    emep_2025_netcdf_source(2024, 'year'),
    paste0('https://thredds.met.no/thredds/dodsC/data/EMEP/2025_Reporting/',
           'EMEP01_rv5.6_year.2024met_2023emis.nc'))
  expect_error(emep_2025_netcdf_source(2025, 'year'), '1990 through 2024')
  expect_error(emep_2025_netcdf_source(2023, 'day'), "'year' or 'month'")
})

test_that('atmospheric deposition inputs are validated', {
  validate <- getFromNamespace('validate_atmo_dep_data', 'SWATprepR')
  valid <- data.frame(DATE = c('2005-01-01', '2004-01-01'), NH4_RF = c(1, 2),
    NO3_RF = c(1, 2), NH4_DRY = c(1, 2), NO3_DRY = c(1, 2))
  expect_identical(as.character(validate(valid)$DATE), c('2004-01-01', '2005-01-01'))
  valid$NH4_RF[1] <- -1
  expect_error(validate(valid), 'non-negative')
})
