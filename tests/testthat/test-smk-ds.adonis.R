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

context("ds.adonis::smk::setup")

connect.studies.dataset.hackathon(list("class_Actinobacteria_id_419", "class_Alphaproteobacteria_id_2379"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.adonis::smk")
test_that("simple adonis", {
    res <- ds.adonis(class_Actinobacteria_id_419~class_Alphaproteobacteria_id_2379, "D")

    expect_length(res, 1)

    expect_length(res$study1, 7)
    expect_equal(class(res$study1), "adonis")
 
    res_names <- names(res$study1)

    expect_length(res_names, 7)
    expect_equal(res_names[1], "aov.tab")
    expect_equal(res_names[2], "call")
    expect_equal(res_names[3], "coefficients")
    expect_equal(res_names[4], "coef.sites")
    expect_equal(res_names[5], "f.perms")
    expect_equal(res_names[6], "model.matrix")
    expect_equal(res_names[7], "terms")
})

#
# Done
#

context("ds.adonis::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D"))
})

disconnect.studies.dataset.hackathon()

context("ds.adonis::smk::done")
