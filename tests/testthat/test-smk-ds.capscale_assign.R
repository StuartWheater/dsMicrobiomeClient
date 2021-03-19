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

connect.studies.dataset.hackathon(list("class_Actinobacteria_id_419", "class_Alphaproteobacteria_id_2379"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.capscale_assign::smk")
test_that("simple capscale_assign", {
    res <- ds.capscale_assign(class_Actinobacteria_id_419~class_Alphaproteobacteria_id_2379, "D", newobj="capscale_obj")

    expect_length(res, 0)

    res_exists <- ds.exists("capscale_obj")

    expect_length(res_exists, 1)
    expect_length(res_exists$study1, 1)
    expect_equal(res_exists$study1, TRUE)

    res_class <- ds.class("capscale_obj")

    expect_length(res_class, 1)
    expect_length(res_class$study1, 1)
    expect_equal(res_class$study1, "capscale")

#    res_names <- ds.names("capscale_obj")

#    expect_length(res_names, 1)
#    expect_length(res_names$study1, 7)
#    expect_equal(res_names$study1[1], "")
#    expect_equal(res_names$study1[2], "")
#    expect_equal(res_names$study1[3], "")
#    expect_equal(res_names$study1[4], "")
#    expect_equal(res_names$study1[5], "")
#    expect_equal(res_names$study1[6], "")
#    expect_equal(res_names$study1[7], "")
})

#
# Done
#

context("ds.capscale_assign::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D", "capscale_obj"))
})

disconnect.studies.dataset.hackathon()

context("ds.capscale_assign::smk::done")
