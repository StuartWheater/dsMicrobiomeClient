#-------------------------------------------------------------------------------
# Copyright (c) 2019-2020 University of Newcastle upon Tyne. All rights reserved.
#
# This program and the accompanying materials
# are made available under the terms of the GNU Public License v3.0.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------

#
# Set up
#

context("ds.capscale::smk::setup")

connect.studies.dataset.hackathon(list("breads", "cheese"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.capscale::smk")
test_that("simple capscale", {
    ds.completeCases("D", "X")

    res <- ds.capscale(X$breads~X$cheese, "X")

    expect_length(res, 1)
    expect_equal(class(res), "list")
    expect_true(all(c("study1") %in% names(res)))

    res_class <- class(res$study1)
    expect_length(res_class, 3)
    expect_true(all(c("capscale", "rda", "cca") %in% res_class))

    expect_length(res$study1, 14)

    res_names <- names(res$study1)

    expect_length(res_names, 14)
    expect_equal(res_names[1], "tot.chi")
    expect_equal(res_names[2], "Ybar")
    expect_equal(res_names[3], "method")
    expect_equal(res_names[4], "call")
    expect_equal(res_names[5], "pCCA")
    expect_equal(res_names[6], "CCA")
    expect_equal(res_names[7], "CA")
    expect_equal(res_names[8], "vdata")
    expect_equal(res_names[9], "colsum")
    expect_equal(res_names[10], "terms")
    expect_equal(res_names[11], "terminfo")
    expect_equal(res_names[12], "sqrt.dist")
    expect_equal(res_names[13], "adjust")
    expect_equal(res_names[14], "inertia")
})

#
# Done
#

context("ds.capscale::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "X"))
})

disconnect.studies.dataset.hackathon()

context("ds.capscale::smk::done")
