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

context("ds.diversity_assign::smk::setup")

connect.studies.dataset.hackathon(list("breads", "cereals", "cheese", "coffee", "dairy", "spreads"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.diversity_assign::smk")
test_that("simple diversity_assign", {
    ds.dataFrame(c("D$breads", "D$cereals", "D$cheese", "D$coffee", "D$dairy", "D$spreads"), newobj="F")

    res <- ds.diversity_assign("F", newobj="diversity_obj")

    expect_length(res, 0)

    res_length <- ds.length("diversity_obj")

    expect_length(res_length, 2)
    expect_equal(res_length$`length of diversity_obj in study1`, 1030)
    expect_equal(res_length$`total length of diversity_obj in all studies combined`, 1030)

    res_class <- ds.class("diversity_obj")

    expect_length(res_class, 1)
    expect_equal(res_class$study1, "numeric")
})

#
# Done
#

context("ds.diversity_assign::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "F", "diversity_obj"))
})

disconnect.studies.dataset.hackathon()

context("ds.diversity_assign::smk::done")
