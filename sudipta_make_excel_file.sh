#!/bin/bash
# create excel file 

 awk 'BEGIN{ OFS="|"; print "Column1|Column2|Column3|Column4|Column5|Column6"};
 NR > 1{print "IND", "INR", $6, $7, $8, $9;}' Output.xls