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

context("ds.vegdist_assign::smk::setup")

connect.studies.dataset.hackathon(list("breads", "cereals", "cheese", "coffee", "dairy", "spreads"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.vegdist_assign::smk")
test_that("simple vegdist_assign", {
    ds.dataFrame(c("D$breads", "D$cereals", "D$cheese", "D$coffee", "D$dairy", "D$spreads"), newobj="F")

    res <- ds.vegdist_assign("F", newobj="vegdist_obj")

    expect_length(res, 0)

    res_length <- ds.length("vegdist_obj")

    expect_length(res_length, 2)
    expect_equal(res_length$`length of vegdist_obj in study1`, 529935)
    expect_equal(res_length$`total length of vegdist_obj in all studies combined`, 529935)

    res_class <- ds.class("vegdist_obj")

    expect_length(res_class, 1)
    expect_equal(res_class$study1, "dist")
})

#
# Done
#

context("ds.vegdist_assign::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "F", "vegdist_obj"))
})

disconnect.studies.dataset.hackathon()

context("ds.vegdist_assign::smk::done")
