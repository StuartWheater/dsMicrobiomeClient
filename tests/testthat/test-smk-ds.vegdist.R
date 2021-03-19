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

context("ds.vegdist::smk::setup")

connect.studies.dataset.hackathon(list("breads", "cereals", "cheese", "coffee", "dairy", "spreads"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.vegdist::smk")
test_that("simple vegdist", {
    ds.dataFrame(c("D$breads", "D$cereals", "D$cheese", "D$coffee", "D$dairy", "D$spreads"), newobj="F")

    res <- ds.vegdist("F")

    expect_length(res, 1)

    expect_length(res$study1, 529935)
    expect_equal(class(res$study1), "dist")
})

#
# Done
#

context("ds.vegdist::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "F"))
})

disconnect.studies.dataset.hackathon()

context("ds.vegdist::smk::done")
