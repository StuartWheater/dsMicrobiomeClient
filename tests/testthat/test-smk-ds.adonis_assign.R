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

context("ds.adonis_assign::smk::setup")

connect.studies.dataset.hackathon(list("class_Actinobacteria_id_419", "class_Alphaproteobacteria_id_2379"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.adonis_assign::smk")
test_that("simple adonis_assign", {
    res <- ds.adonis_assign(class_Actinobacteria_id_419~class_Alphaproteobacteria_id_2379, "D", newobj="adonis_obj")

    expect_length(res, 0)

    res_exists <- ds.exists("adonis_obj")

    expect_length(res_exists, 1)
    expect_length(res_exists$study1, 1)
    expect_equal(res_exists$study1, TRUE)

    res_class <- ds.class("adonis_obj")

    expect_length(res_class, 1)
    expect_length(res_class$study1, 1)
    expect_equal(res_class$study1, "adonis")

    res_names <- ds.names("adonis_obj")

    expect_length(res_names, 1)
    expect_length(res_names$study1, 7)
    expect_equal(res_names$study1[1], "aov.tab")
    expect_equal(res_names$study1[2], "call")
    expect_equal(res_names$study1[3], "coefficients")
    expect_equal(res_names$study1[4], "coef.sites")
    expect_equal(res_names$study1[5], "f.perms")
    expect_equal(res_names$study1[6], "model.matrix")
    expect_equal(res_names$study1[7], "terms")
})

#
# Done
#

context("ds.adonis_assign::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "adonis_obj"))
})

disconnect.studies.dataset.hackathon()

context("ds.adonis_assign::smk::done")
