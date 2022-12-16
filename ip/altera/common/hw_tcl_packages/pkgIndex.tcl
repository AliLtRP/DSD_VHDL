# Tcl package index file, version 1.1
# This file is generated by the "pkg_mkIndex" command
# and sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.

package ifneeded altera_exec 1.0 [list source [file join $dir altera_exec.tcl]]
package ifneeded altera_hwtcl_qtcl 1.0 [list source [file join $dir altera_hwtcl_qtcl.tcl]]
package ifneeded altera_hwtcl_xml_validator 1.0 [list source [file join $dir altera_hwtcl_xml_validator.tcl]]
package ifneeded altera_pe_message_format 1.0 [list source [file join $dir altera_pe_message_format.tcl]]
package ifneeded altera_tcl_testlib 1.0 [list source [file join $dir altera_tcl_testlib.tcl]]
package ifneeded altera_terp 1.0 [list source [file join $dir altera_terp.tcl]]
package ifneeded altera_version 1.0 [list source [file join $dir altera_version.tcl]]
package ifneeded quartus::advanced_hssi_legality 1.0 [list source [file join $dir quartus_advanced_hssi_legality.tcl]]
package ifneeded quartus::advanced_pll_legality 1.0 [list source [file join $dir quartus_advanced_pll_legality.tcl]]
package ifneeded quartus::advanced_wysiwyg 1.0 [list source [file join $dir quartus_advanced_wysiwyg.tcl]]
package ifneeded quartus::device 1.0 [list source [file join $dir quartus_device.tcl]]
package ifneeded quartus::qcl_pll 1.0 [list source [file join $dir quartus_qcl_pll.tcl]]
