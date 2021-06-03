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

context("ds.capscale_assign::smk::setup")

connect.studies.dataset.hackathon(list("breads", "cheese"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.capscale_assign::smk")
test_that("simple capscale_assign", {
    ds.completeCases("D", "X")

    res <- ds.capscale_assign(X$breads~X$cheese, "X", newobj="capscale_obj")

    expect_length(res, 0)

    res_exists <- ds.exists("capscale_obj")

    expect_length(res_exists, 1)
    expect_length(res_exists$study1, 1)
    expect_equal(res_exists$study1, TRUE)

    res_class <- ds.class("capscale_obj")

    expect_length(res_class, 1)
    expect_length(res_class$study1, 3)
    expect_true(all(c("capscale", "rda", "cca") %in% res_class$study1))

    res_names <- ds.names("capscale_obj")

    expect_length(res_names, 1)
    expect_length(res_names$study1, 14)
    expect_equal(res_names$study1[1], "tot.chi")
    expect_equal(res_names$study1[2], "Ybar")
    expect_equal(res_names$study1[3], "method")
    expect_equal(res_names$study1[4], "call")
    expect_equal(res_names$study1[5], "pCCA")
    expect_equal(res_names$study1[6], "CCA")
    expect_equal(res_names$study1[7], "CA")
    expect_equal(res_names$study1[8], "vdata")
    expect_equal(res_names$study1[9], "colsum")
    expect_equal(res_names$study1[10], "terms")
    expect_equal(res_names$study1[11], "terminfo")
    expect_equal(res_names$study1[12], "sqrt.dist")
    expect_equal(res_names$study1[13], "adjust")
    expect_equal(res_names$study1[14], "inertia")
})

#
# Done
#

context("ds.capscale_assign::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "X", "capscale_obj"))
})

disconnect.studies.dataset.hackathon()

context("ds.capscale_assign::smk::done")
